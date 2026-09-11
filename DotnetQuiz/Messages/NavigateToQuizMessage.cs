using DotnetQuiz.Models;

namespace DotnetQuiz.Messages;

/// <summary>Сигнал: начать квиз с выбранной сложностью.</summary>
public class NavigateToQuizMessage
{
    public Difficulty Difficulty { get; }

    public NavigateToQuizMessage(Difficulty difficulty)
    {
        Difficulty = difficulty;
    }
}
