using System.IO;

namespace DotnetQuiz.Data;

/// <summary>
/// Выполняет seed-SQL-файлы с вопросами при старте приложения.
/// Сами данные (текст вопросов и вариантов) находятся в .sql-файлах рядом с этим классом,
/// а не в коде — логика идемпотентности (INSERT ... WHERE NOT EXISTS) реализована прямо в SQL,
/// поэтому повторный запуск с уже наполненной базой ничего не дублирует.
/// </summary>
public static class QuestionSeeder
{
    public static void SeedFromSqlFile(SqliteConnectionFactory factory, string sqlFilePath)
    {
        if (!File.Exists(sqlFilePath))
        {
            return;
        }

        var sql = File.ReadAllText(sqlFilePath);
        if (string.IsNullOrWhiteSpace(sql))
        {
            return;
        }

        using var connection = factory.CreateConnection();
        connection.Open();

        using var command = connection.CreateCommand();
        command.CommandText = sql;
        command.ExecuteNonQuery();
    }
}
