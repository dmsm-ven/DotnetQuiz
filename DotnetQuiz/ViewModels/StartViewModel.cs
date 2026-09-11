using System.Windows;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using DotnetQuiz.Messages;
using DotnetQuiz.Models;

namespace DotnetQuiz.ViewModels;

/// <summary>Стартовый экран: выбор сложности, "Начать" и "Выход".</summary>
public partial class StartViewModel : ObservableObject
{
    [ObservableProperty]
    private Difficulty _selectedDifficulty = Difficulty.Easy;

    [RelayCommand]
    private void Start()
    {
        WeakReferenceMessenger.Default.Send(new NavigateToQuizMessage(SelectedDifficulty));
    }

    [RelayCommand]
    private void Exit()
    {
        Application.Current.Shutdown();
    }
}
