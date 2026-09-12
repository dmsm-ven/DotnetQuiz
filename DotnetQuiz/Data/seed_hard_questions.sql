-- Автогенерируемый (человеком проверенный) seed-файл вопросов уровня Hard.
-- Логика идемпотентна: вопрос добавляется только если его текста ещё нет в таблице Questions.
-- CorrectOptionIndex: 0 = OptionA, 1 = OptionB, 2 = OptionC, 3 = OptionD

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Что произойдёт при синхронном вызове task.Result из потока с SynchronizationContext (например, UI-поток WPF), если внутри задачи используется await без ConfigureAwait(false)?', 'Возникнет deadlock при возврате в захваченный контекст', 'Задача продолжит выполняться асинхронно без единой блокировки', 'Будет выброшено исключение NotSupportedException немедленно', 'GC соберёт задачу как недостижимый объект сразу же', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Что произойдёт при синхронном вызове task.Result из потока с SynchronizationContext (например, UI-поток WPF), если внутри задачи используется await без ConfigureAwait(false)?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Куда попадают объекты размером более 85 000 байт в управляемой куче .NET и как они собираются сборщиком мусора?', 'В поколении Gen0 наравне со всеми маленькими объектами', 'В поколении Gen1 при повторной сборке мусора', 'В Large Object Heap, собираемом вместе с Gen2', 'В отдельном Gen3, не связанном с обычной кучей', 2
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Куда попадают объекты размером более 85 000 байт в управляемой куче .NET и как они собираются сборщиком мусора?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'В чём смысл передачи readonly struct через параметр с модификатором in?', 'in копирует struct дважды для дополнительной безопасности', 'Struct передаётся по ссылке как read-only без копирования', 'readonly struct с in становится ссылочным типом автоматически', 'Модификатор in применим только к классам, не к struct', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'В чём смысл передачи readonly struct через параметр с модификатором in?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему повторное перечисление одного и того же IEnumerable<T>, построенного через LINQ (Where/Select), может приводить к неожиданным результатам или повторным побочным эффектам?', 'IEnumerable кэширует результат после первого прохода целиком', 'LINQ выполняется лениво и пересчитывается при каждом проходе', 'IEnumerable нельзя перечислить дважды — будет исключение', 'Повторное перечисление всегда возвращает пустую коллекцию', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему повторное перечисление одного и того же IEnumerable<T>, построенного через LINQ (Where/Select), может приводить к неожиданным результатам или повторным побочным эффектам?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Какая типичная причина гонки данных (race condition) внутри тела делегата Parallel.ForEach?', 'Использование локальной переменной внутри тела делегата', 'Обращение к общему состоянию без синхронизации потоков', 'Parallel.ForEach потокобезопасен по умолчанию всегда', 'Использование foreach вместо for внутри делегата', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Какая типичная причина гонки данных (race condition) внутри тела делегата Parallel.ForEach?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'В чём ключевое отличие SemaphoreSlim от lock (Monitor)?', 'SemaphoreSlim допускает несколько входов и Release из другого потока', 'SemaphoreSlim работает только в асинхронном коде и нигде больше', 'lock поддерживает несколько потоков, а SemaphoreSlim — только один', 'Это два названия одного и того же механизма синхронизации', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'В чём ключевое отличие SemaphoreSlim от lock (Monitor)?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Имеет ли значение порядок регистрации middleware в конвейере ASP.NET Core (Program.cs) и почему?', 'Не имеет значения — порядок конвейера случайный', 'Имеет значение — от него зависит порядок обработки', 'Middleware срабатывают только для определённого метода', 'Middleware не умеет прерывать обработку запроса досрочно', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Имеет ли значение порядок регистрации middleware в конвейере ASP.NET Core (Program.cs) и почему?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Что произойдёт, если при настройке TokenValidationParameters для JWT выставить ValidateLifetime = false?', 'Токен вообще перестанет проверяться на подпись', 'Приложение примет даже просроченный токен — это риск', 'Это ускорит проверку токена без последствий для системы', 'Токены после этого станут строго одноразовыми', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Что произойдёт, если при настройке TokenValidationParameters для JWT выставить ValidateLifetime = false?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Что требуется, чтобы lazy loading заработал в Entity Framework Core?', 'Достаточно вызвать .Include() для нужной коллекции', 'Нужен пакет прокси и navigation-свойства объявлены virtual', 'Lazy loading включён по умолчанию во всех версиях EF Core', 'Достаточно указать AsNoTracking() в исходном запросе', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Что требуется, чтобы lazy loading заработал в Entity Framework Core?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Чем запрос с AsNoTracking() отличается от обычного отслеживаемого запроса в EF Core?', 'AsNoTracking полностью запрещает чтение данных из базы', 'Сущности не отслеживаются, обновление требует повторный Attach', 'AsNoTracking ускоряет саму запись данных в базу', 'AsNoTracking кеширует результат в памяти навсегда', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Чем запрос с AsNoTracking() отличается от обычного отслеживаемого запроса в EF Core?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'В чём принципиальное отличие Dapper от Entity Framework Core как инструмента доступа к данным?', 'Dapper — полноценный ORM с change tracking и миграциями', 'Dapper — микро-ORM без автогенерации SQL и change tracking', 'EF Core не поддерживает LINQ, а Dapper поддерживает', 'Оба инструмента идентичны по возможностям и скорости', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'В чём принципиальное отличие Dapper от Entity Framework Core как инструмента доступа к данным?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Каково ключевое правило направления зависимостей в Onion (луковой) архитектуре?', 'Внешние слои зависят от внутренних, а не наоборот', 'Все слои взаимно зависят друг от друга без правил', 'Domain-слой сам зависит от Infrastructure напрямую', 'В Onion архитектуре нет отдельного Domain-слоя', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Каково ключевое правило направления зависимостей в Onion (луковой) архитектуре?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'В чём основная идея Vertical Slice архитектуры?', 'Код организован по техническим слоям — Controllers, Services', 'Код организован по фичам: каждый срез содержит всё нужное', 'Это просто другое название Onion архитектуры', 'Vertical Slice запрещает использование паттерна CQRS', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'В чём основная идея Vertical Slice архитектуры?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Какой паттерн чаще всего применяют в микросервисной архитектуре для согласованности данных между сервисами без распределённых транзакций?', 'Singleton', 'Saga', 'Adapter', 'Decorator', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Какой паттерн чаще всего применяют в микросервисной архитектуре для согласованности данных между сервисами без распределённых транзакций?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Какая проблема характерна для наивной реализации Singleton в многопоточном приложении и как её обычно решают?', 'Проблемы нет — Singleton всегда потокобезопасен', 'Возможны гонки при создании; решение — double-checked locking', 'Singleton нельзя использовать в многопоточном коде вообще', 'Решение — сделать класс static, убрав сам Singleton', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Какая проблема характерна для наивной реализации Singleton в многопоточном приложении и как её обычно решают?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Что такое ''captive dependency'' при работе с DI-контейнером и временем жизни сервисов (lifetimes)?', 'Singleton захватывает Scoped/Transient зависимость дольше срока', 'Ошибка компиляции при регистрации сервисов в контейнере', 'Требование регистрировать все сервисы как Singleton', 'Другое название циклической зависимости между сервисами', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Что такое ''captive dependency'' при работе с DI-контейнером и временем жизни сервисов (lifetimes)?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Чем паттерн Decorator принципиально отличается от простого наследования для расширения поведения объекта?', 'Decorator нельзя применить дважды к одному объекту', 'Decorator оборачивает объект в рантайме, комбинируя поведение', 'Наследование и Decorator — взаимозаменяемые понятия', 'Decorator применим только к статическим методам класса', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Чем паттерн Decorator принципиально отличается от простого наследования для расширения поведения объекта?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Для чего в xUnit используется атрибут [Theory] в сочетании с [InlineData]?', 'Чтобы явно пометить метод как игнорируемый тест', 'Чтобы запускать тест многократно с разными данными', 'Чтобы тест запускался только вручную, а не в CI', 'Это просто другое имя для атрибута [Fact]', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Для чего в xUnit используется атрибут [Theory] в сочетании с [InlineData]?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'На каком транспортном протоколе и формате сериализации по умолчанию построен gRPC?', 'HTTP/1.1 и текстовый формат JSON', 'HTTP/2 и бинарный формат Protocol Buffers', 'WebSocket-соединение и формат XML', 'TCP напрямую без HTTP и формат YAML', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'На каком транспортном протоколе и формате сериализации по умолчанию построен gRPC?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Чем ConcurrentDictionary<TKey,TValue> отличается от обычного Dictionary<TKey,TValue> при доступе из нескольких потоков?', 'Оба типа одинаково потокобезопасны из коробки', 'ConcurrentDictionary безопасен без внешних блокировок', 'Dictionary всегда быстрее при работе из потоков', 'ConcurrentDictionary поддерживает только чтение данных', 1
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Чем ConcurrentDictionary<TKey,TValue> отличается от обычного Dictionary<TKey,TValue> при доступе из нескольких потоков?');
