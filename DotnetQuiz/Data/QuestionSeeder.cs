using Dapper;

namespace DotnetQuiz.Data;

/// <summary>
/// Одноразовое наполнение таблицы Questions вопросами уровня "Сложно" по тематике .NET.
/// Идемпотентно: если вопросы уровня Hard уже есть в базе, повторной вставки не происходит.
/// </summary>
public static class QuestionSeeder
{
    private const string Difficulty = "Hard";

    public static void SeedHardQuestions(SqliteConnectionFactory factory)
    {
        using var connection = factory.CreateConnection();
        connection.Open();

        var alreadySeeded = connection.ExecuteScalar<long>(
            "SELECT COUNT(*) FROM Questions WHERE Difficulty = @Difficulty",
            new { Difficulty });

        if (alreadySeeded > 0)
        {
            return;
        }

        var questions = new[]
        {
            new {
                Difficulty,
                Text = "Что произойдёт при синхронном вызове task.Result из потока с SynchronizationContext (например, UI-поток WPF), если внутри задачи используется await без ConfigureAwait(false)?",
                OptionA = "Возникнет deadlock из-за попытки продолжения вернуться в захваченный контекст",
                OptionB = "Задача выполнится асинхронно без блокировок",
                OptionC = "Будет выброшено исключение NotSupportedException",
                OptionD = "GC немедленно соберёт задачу как недостижимый объект",
                CorrectOptionIndex = 0
            },
            new {
                Difficulty,
                Text = "Куда попадают объекты размером более 85 000 байт в управляемой куче .NET и как они собираются сборщиком мусора?",
                OptionA = "В Gen0, как и все остальные объекты",
                OptionB = "В Gen1",
                OptionC = "В Large Object Heap (LOH), который логически собирается вместе с Gen2",
                OptionD = "В отдельный Gen3, не связанный с обычной кучей",
                CorrectOptionIndex = 2
            },
            new {
                Difficulty,
                Text = "В чём смысл передачи readonly struct через параметр с модификатором in?",
                OptionA = "in копирует struct дважды для дополнительной безопасности",
                OptionB = "Struct передаётся по ссылке как read-only без копирования, а компилятор гарантирует неизменяемость на месте вызова",
                OptionC = "readonly struct с in автоматически становится ссылочным типом",
                OptionD = "in применим только к классам, а не к struct",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "Почему повторное перечисление одного и того же IEnumerable<T>, построенного через LINQ (Where/Select), может приводить к неожиданным результатам или повторным побочным эффектам?",
                OptionA = "IEnumerable кэширует результат после первого прохода",
                OptionB = "LINQ-запросы выполняются лениво (deferred execution) и пересчитываются заново при каждом перечислении источника",
                OptionC = "IEnumerable нельзя перечислить больше одного раза — это вызовет исключение",
                OptionD = "Второе перечисление всегда возвращает пустую коллекцию",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "Какая типичная причина гонки данных (race condition) внутри тела делегата Parallel.ForEach?",
                OptionA = "Использование локальной переменной, объявленной внутри тела делегата",
                OptionB = "Обращение к общему изменяемому состоянию (внешней коллекции, счётчику) без синхронизации",
                OptionC = "Parallel.ForEach потокобезопасен по умолчанию для любых операций",
                OptionD = "Использование foreach вместо for внутри делегата",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "В чём ключевое отличие SemaphoreSlim от lock (Monitor)?",
                OptionA = "SemaphoreSlim можно освободить из другого потока и он допускает несколько одновременных входов, тогда как lock — только один поток, и снят должен быть тем же потоком, что захватил",
                OptionB = "SemaphoreSlim работает только в асинхронном коде и больше ни для чего не применим",
                OptionC = "lock поддерживает несколько одновременных потоков, а SemaphoreSlim — только один",
                OptionD = "Разницы нет, это два названия одного и того же механизма",
                CorrectOptionIndex = 0
            },
            new {
                Difficulty,
                Text = "Имеет ли значение порядок регистрации middleware в конвейере ASP.NET Core (Program.cs) и почему?",
                OptionA = "Не имеет значения, конвейер выполняется в случайном порядке",
                OptionB = "Имеет значение: каждый middleware может обработать запрос до/после вызова следующего, поэтому, например, UseAuthorization должен идти после UseAuthentication",
                OptionC = "Middleware выполняются только для запросов с определённым HTTP-методом",
                OptionD = "Middleware не может прервать обработку запроса досрочно",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "Что произойдёт, если при настройке TokenValidationParameters для JWT выставить ValidateLifetime = false?",
                OptionA = "Токен вообще не будет проверяться на подпись",
                OptionB = "Приложение начнёт принимать даже просроченные токены, что является уязвимостью в продакшене",
                OptionC = "Это ускорит проверку токена без последствий для безопасности",
                OptionD = "Токены станут одноразовыми (single-use)",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "Что требуется, чтобы lazy loading заработал в Entity Framework Core?",
                OptionA = "Достаточно вызвать .Include() для нужной навигационной коллекции",
                OptionB = "Установить пакет прокси (UseLazyLoadingProxies), а навигационные свойства объявить как virtual",
                OptionC = "Lazy loading включён по умолчанию во всех версиях EF Core без дополнительной настройки",
                OptionD = "Указать AsNoTracking() в исходном запросе",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "Чем запрос с AsNoTracking() отличается от обычного отслеживаемого запроса в EF Core?",
                OptionA = "AsNoTracking полностью запрещает чтение данных из базы",
                OptionB = "Сущности не попадают в ChangeTracker, что снижает накладные расходы, но делает невозможным их обновление через SaveChanges без повторного Attach",
                OptionC = "AsNoTracking ускоряет саму запись данных в базу",
                OptionD = "AsNoTracking автоматически кеширует результат в памяти навсегда",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "В чём принципиальное отличие Dapper от Entity Framework Core как инструмента доступа к данным?",
                OptionA = "Dapper — полнофункциональный ORM с change tracking и миграциями, как EF Core",
                OptionB = "Dapper — микро-ORM: не генерирует SQL сам и не отслеживает изменения сущностей, оставляя написание запросов разработчику, за счёт чего обычно быстрее",
                OptionC = "EF Core не поддерживает LINQ, а Dapper поддерживает",
                OptionD = "Оба инструмента идентичны по возможностям и производительности",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "Каково ключевое правило направления зависимостей в Onion (луковой) архитектуре?",
                OptionA = "Внешние слои (Infrastructure, UI) могут зависеть от внутренних (Domain), но не наоборот",
                OptionB = "Все слои зависят друг от друга напрямую без каких-либо ограничений",
                OptionC = "Domain-слой зависит от Infrastructure для доступа к базе данных",
                OptionD = "В Onion архитектуре отсутствует понятие Domain-слоя",
                CorrectOptionIndex = 0
            },
            new {
                Difficulty,
                Text = "В чём основная идея Vertical Slice архитектуры?",
                OptionA = "Код организуется по техническим слоям (Controllers, Services, Repositories), общим для всего приложения",
                OptionB = "Код организуется по функциональным возможностям (фичам): каждый 'срез' содержит всё нужное для одной операции, минимизируя связанность между фичами",
                OptionC = "Это просто другое название Onion архитектуры",
                OptionD = "Vertical Slice запрещает использование паттерна CQRS",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "Какой паттерн чаще всего применяют в микросервисной архитектуре для согласованности данных между сервисами без распределённых транзакций?",
                OptionA = "Singleton",
                OptionB = "Saga",
                OptionC = "Adapter",
                OptionD = "Decorator",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "Какая проблема характерна для наивной реализации Singleton в многопоточном приложении и как её обычно решают?",
                OptionA = "Проблемы нет, Singleton всегда потокобезопасен по определению",
                OptionB = "Возможно создание нескольких экземпляров при одновременном доступе из разных потоков; решается через double-checked locking или Lazy<T>",
                OptionC = "Singleton в принципе нельзя использовать в многопоточном коде",
                OptionD = "Решение — сделать класс static, что устраняет саму концепцию Singleton",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "Что такое 'captive dependency' при работе с DI-контейнером и временем жизни сервисов (lifetimes)?",
                OptionA = "Ситуация, когда Singleton-сервис захватывает ссылку на Scoped или Transient зависимость, из-за чего та живёт дольше положенного",
                OptionB = "Ошибка компиляции при регистрации сервисов в контейнере",
                OptionC = "Обязательное требование регистрировать абсолютно все сервисы как Singleton",
                OptionD = "Другое название циклической зависимости между сервисами",
                CorrectOptionIndex = 0
            },
            new {
                Difficulty,
                Text = "Чем паттерн Decorator принципиально отличается от простого наследования для расширения поведения объекта?",
                OptionA = "Decorator нельзя применить несколько раз подряд к одному объекту",
                OptionB = "Decorator оборачивает объект во время выполнения, позволяя динамически комбинировать поведение без изменения иерархии классов, тогда как наследование фиксируется на этапе компиляции",
                OptionC = "Наследование и Decorator — это полностью взаимозаменяемые понятия",
                OptionD = "Decorator применим только к статическим методам",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "Для чего в xUnit используется атрибут [Theory] в сочетании с [InlineData]?",
                OptionA = "Чтобы пометить метод как игнорируемый тест",
                OptionB = "Чтобы запустить один и тот же тестовый метод несколько раз с разными наборами входных параметров",
                OptionC = "Чтобы тест выполнялся только вручную, а не в CI",
                OptionD = "Это просто синоним [Fact] без функциональных отличий",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "На каком транспортном протоколе и формате сериализации по умолчанию построен gRPC?",
                OptionA = "HTTP/1.1 и JSON",
                OptionB = "HTTP/2 и Protocol Buffers (protobuf)",
                OptionC = "WebSocket и XML",
                OptionD = "TCP напрямую без HTTP и YAML",
                CorrectOptionIndex = 1
            },
            new {
                Difficulty,
                Text = "Чем ConcurrentDictionary<TKey,TValue> отличается от обычного Dictionary<TKey,TValue> при доступе из нескольких потоков?",
                OptionA = "Ничем, оба типа потокобезопасны по умолчанию",
                OptionB = "ConcurrentDictionary спроектирован для безопасного одновременного доступа из нескольких потоков без внешней блокировки, тогда как Dictionary при конкурентной модификации может повредить внутреннее состояние или бросить исключение",
                OptionC = "Dictionary всегда быстрее ConcurrentDictionary в любых многопоточных сценариях",
                OptionD = "ConcurrentDictionary поддерживает только чтение, но не добавление элементов",
                CorrectOptionIndex = 1
            },
        };

        const string insertSql = """
            INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
            VALUES (@Difficulty, @Text, @OptionA, @OptionB, @OptionC, @OptionD, @CorrectOptionIndex)
            """;

        connection.Execute(insertSql, questions);
    }
}
