using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Messaging;
using DotnetQuiz.Messages;
using DotnetQuiz.Services;

namespace DotnetQuiz.ViewModels;

/// <summary>
/// Главная ViewModel окна. Хранит текущий "экран" (ViewModel) и переключает его
/// по сообщениям навигации от дочерних ViewModel.
/// </summary>
public partial class MainViewModel : ObservableObject
{
    private readonly IQuestionRepository _questionRepository;

    [ObservableProperty]
    private ObservableObject _currentViewModel;

    public MainViewModel(IQuestionRepository questionRepository)
    {
        _questionRepository = questionRepository;
        _currentViewModel = new StartViewModel();

        WeakReferenceMessenger.Default.Register<NavigateToQuizMessage>(this, (_, message) =>
        {
            CurrentViewModel = new QuizViewModel(_questionRepository, message.Difficulty);
        });

        WeakReferenceMessenger.Default.Register<NavigateToResultMessage>(this, (_, message) =>
        {
            CurrentViewModel = new ResultViewModel(message.CorrectCount, message.TotalCount);
        });

        WeakReferenceMessenger.Default.Register<NavigateToStartMessage>(this, (_, _) =>
        {
            CurrentViewModel = new StartViewModel();
        });
    }
}
