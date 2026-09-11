namespace DotnetQuiz.Data;

/// <summary>
/// Создаёт схему БД при первом запуске, если файла/таблицы ещё нет.
/// Заполнение реальными вопросами сюда намеренно не входит — см. Data/seed_template.sql.
/// </summary>
public static class DatabaseInitializer
{
    private const string CreateTableSql = """
        CREATE TABLE IF NOT EXISTS Questions (
            Id                 INTEGER PRIMARY KEY AUTOINCREMENT,
            Difficulty         TEXT    NOT NULL,
            Text               TEXT    NOT NULL,
            OptionA            TEXT    NOT NULL,
            OptionB            TEXT    NOT NULL,
            OptionC            TEXT    NOT NULL,
            OptionD            TEXT    NOT NULL,
            CorrectOptionIndex INTEGER NOT NULL
        );
        """;

    public static void Initialize(SqliteConnectionFactory factory)
    {
        using var connection = factory.CreateConnection();
        connection.Open();

        using var command = connection.CreateCommand();
        command.CommandText = CreateTableSql;
        command.ExecuteNonQuery();
    }
}
