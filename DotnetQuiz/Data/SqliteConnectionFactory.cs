using Microsoft.Data.Sqlite;

namespace DotnetQuiz.Data;

/// <summary>
/// Создаёт подключения к файлу SQLite, который лежит рядом с exe.
/// </summary>
public class SqliteConnectionFactory
{
    private readonly string _connectionString;

    public SqliteConnectionFactory()
    {
        var dbPath = Path.Combine(AppContext.BaseDirectory, "quiz.db");
        _connectionString = $"Data Source={dbPath}";
    }

    public string DbPath => new SqliteConnectionStringBuilder(_connectionString).DataSource;

    public SqliteConnection CreateConnection() => new SqliteConnection(_connectionString);
}
