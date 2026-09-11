using DotnetQuiz.Models;

namespace DotnetQuiz.Services;

public interface IQuestionRepository
{
    /// <summary>
    /// Возвращает до <paramref name="count"/> вопросов заданной сложности в случайном порядке.
    /// </summary>
    Task<List<Question>> GetRandomQuestionsAsync(Difficulty difficulty, int count = 20);
}
