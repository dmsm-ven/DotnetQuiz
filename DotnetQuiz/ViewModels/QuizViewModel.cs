using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using DotnetQuiz.Messages;
using DotnetQuiz.Models;
using DotnetQuiz.Services;

namespace DotnetQuiz.ViewModels;

/// <summary>Экран прохождения квиза: один вопрос за раз, случайный порядок.</summary>
public partial class QuizViewModel : ObservableObject
{
    private readonly List<Question> _questions = new();
    private int _correctCount;

    [ObservableProperty]
    private Question? _currentQuestion;

    /// <summary>Номер текущего вопроса (начиная с 1) для отображения "Вопрос X из N".</summary>
    [ObservableProperty]
    private int _currentQuestionNumber = 1;

    [ObservableProperty]
    private int _totalQuestions;

    [ObservableProperty]
    private int? _selectedOptionIndex;

    [ObservableProperty]
    private bool _isLoading = true;

    public QuizViewModel(IQuestionRepository questionRepository, Difficulty difficulty)
    {
        _ = LoadQuestionsAsync(questionRepository, difficulty);
    }

    private async Task LoadQuestionsAsync(IQuestionRepository repository, Difficulty difficulty)
    {
        var questions = await repository.GetRandomQuestionsAsync(difficulty, 20);

        _questions.Clear();
        _questions.AddRange(questions);
        TotalQuestions = _questions.Count;

        if (_questions.Count > 0)
        {
            CurrentQuestion = _questions[0];
        }

        IsLoading = false;
    }

    partial void OnSelectedOptionIndexChanged(int? value)
    {
        NextCommand.NotifyCanExecuteChanged();
    }

    private bool CanGoNext() => SelectedOptionIndex.HasValue;

    [RelayCommand(CanExecute = nameof(CanGoNext))]
    private void Next()
    {
        if (CurrentQuestion != null && SelectedOptionIndex == CurrentQuestion.CorrectOptionIndex)
        {
            _correctCount++;
        }

        if (CurrentQuestionNumber >= _questions.Count)
        {
            Finish();
            return;
        }

        SelectedOptionIndex = null;
        CurrentQuestion = _questions[CurrentQuestionNumber];
        CurrentQuestionNumber++;
    }

    /// <summary>Досрочное завершение квиза (кнопка "Закончить").</summary>
    [RelayCommand]
    private void Finish()
    {
        WeakReferenceMessenger.Default.Send(new NavigateToResultMessage(_correctCount, _questions.Count));
    }
}
