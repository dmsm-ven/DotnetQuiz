namespace DotnetQuiz.Messages;

/// <summary>Сигнал: показать экран результата.</summary>
public class NavigateToResultMessage
{
    public int CorrectCount { get; }
    public int TotalCount { get; }

    public NavigateToResultMessage(int correctCount, int totalCount)
    {
        CorrectCount = correctCount;
        TotalCount = totalCount;
    }
}
