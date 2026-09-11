namespace DotnetQuiz.Models;

public class Question
{
    public int Id { get; set; }
    public string Difficulty { get; set; } = string.Empty;
    public string Text { get; set; } = string.Empty;
    public string OptionA { get; set; } = string.Empty;
    public string OptionB { get; set; } = string.Empty;
    public string OptionC { get; set; } = string.Empty;
    public string OptionD { get; set; } = string.Empty;

    /// <summary>0 = A, 1 = B, 2 = C, 3 = D</summary>
    public int CorrectOptionIndex { get; set; }

    public string[] Options => new[] { OptionA, OptionB, OptionC, OptionD };
}
