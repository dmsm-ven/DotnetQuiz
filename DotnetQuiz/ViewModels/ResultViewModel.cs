using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using DotnetQuiz.Messages;

namespace DotnetQuiz.ViewModels;

/// <summary>Экран результата: количество правильных ответов + "Начать заново".</summary>
public partial class ResultViewModel : ObservableObject
{
    [ObservableProperty]
    private int _correctCount;

    [ObservableProperty]
    private int _totalCount;

    public ResultViewModel(int correctCount, int totalCount)
    {
        _correctCount = correctCount;
        _totalCount = totalCount;
    }

    [RelayCommand]
    private void RestartQuiz()
    {
        WeakReferenceMessenger.Default.Send(new NavigateToStartMessage());
    }
}
