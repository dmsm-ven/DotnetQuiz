using Dapper;
using DotnetQuiz.Data;
using DotnetQuiz.Models;

namespace DotnetQuiz.Services;

public class QuestionRepository : IQuestionRepository
{
    private readonly SqliteConnectionFactory _connectionFactory;

    public QuestionRepository(SqliteConnectionFactory connectionFactory)
    {
        _connectionFactory = connectionFactory;
    }

    public async Task<List<Question>> GetRandomQuestionsAsync(Difficulty difficulty, int count = 20)
    {
        using var connection = _connectionFactory.CreateConnection();

        const string sql = """
            SELECT *
            FROM Questions
            WHERE Difficulty = @Difficulty
            ORDER BY RANDOM()
            LIMIT @Count
            """;

        var result = await connection.QueryAsync<Question>(sql, new
        {
            Difficulty = difficulty.ToString(),
            Count = count
        });

        return result.ToList();
    }
}
