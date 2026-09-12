-- Второй пакет вопросов уровня Hard (из присланного дампа questions_dump.sql, конвертирован в формат с 4 вариантами ответа).
-- Логика идемпотентна: вопрос добавляется только если его текста ещё нет в таблице Questions.
-- CorrectOptionIndex: 0 = OptionA, 1 = OptionB, 2 = OptionC, 3 = OptionD

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'При проверке типа struct через `obj is int i`, если `obj` уже был boxed ранее — какая операция выполняется?', 'Выполняется unboxing уже упакованного значения', 'Выполняется повторный boxing перед сравнением типов', 'Выполняется прямое приведение к ref struct без копий', 'Компилятор выдаёт ошибку при сравнении struct с object', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'При проверке типа struct через `obj is int i`, если `obj` уже был boxed ранее — какая операция выполняется?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему исключение внутри `async void` метода не перехватывается обычным try/catch вызывающего кода?', 'Потому что async void не возвращает Task, и await ничего не ждёт', 'Потому что исключения в async void автоматически логируются и гасятся', 'Потому что async void всегда выполняется синхронно, минуя await', 'Потому что try/catch не работает внутри async методов вообще', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему исключение внутри `async void` метода не перехватывается обычным try/catch вызывающего кода?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему UseAuthorization должен быть зарегистрирован после UseRouting в конвейере ASP.NET Core?', 'Потому что авторизации нужны данные об endpoint от routing', 'Потому что UseRouting иначе не сможет обработать входящий запрос вовсе', 'Потому что порядок регистрации middleware не влияет на выполнение', 'Потому что UseAuthorization всегда выполняется до UseExceptionHandler', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему UseAuthorization должен быть зарегистрирован после UseRouting в конвейере ASP.NET Core?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Как правильно использовать Scoped-сервис внутри Singleton в .NET DI, избегая captive dependency?', 'Внедрить IServiceScopeFactory и создавать scope вручную', 'Просто внедрить Scoped-сервис напрямую через конструктор Singleton', 'Зарегистрировать сервис одновременно как Singleton и Scoped', 'Использовать статическое поле для хранения экземпляра сервиса', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Как правильно использовать Scoped-сервис внутри Singleton в .NET DI, избегая captive dependency?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Какой уровень изоляции транзакций в PostgreSQL предотвращает phantom read за счёт снимка данных на начало транзакции?', 'Repeatable Read — за счёт MVCC snapshot isolation', 'Read Committed — за счёт блокировки строк при чтении', 'Read Uncommitted — за счёт отключения журналирования', 'Serializable в PostgreSQL не связан со snapshot isolation', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Какой уровень изоляции транзакций в PostgreSQL предотвращает phantom read за счёт снимка данных на начало транзакции?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему запрос WHERE column LIKE ''%abc'' обычно не может эффективно использовать обычный B-Tree индекс?', 'Совпадение может начинаться в любой позиции строки', 'Ведущий wildcard автоматически конвертируется в JOIN с временной таблицей', 'B-Tree индексы вообще не поддерживают оператор LIKE ни в каком виде', 'PostgreSQL всегда игнорирует LIKE-запросы при наличии индекса', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему запрос WHERE column LIKE ''%abc'' обычно не может эффективно использовать обычный B-Tree индекс?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Как избежать проблемы N+1 запросов при использовании навигационных свойств в EF Core?', 'Использовать Eager loading через .Include() для JOIN-запроса', 'Всегда использовать lazy loading для минимизации количества запросов', 'Отключить SaveChanges, чтобы избежать лишних запросов чтения', 'Использовать AsNoTracking для устранения дополнительных запросов', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Как избежать проблемы N+1 запросов при использовании навигационных свойств в EF Core?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Как хэш-шардирование в MongoDB решает проблему ''горячего'' шарда при монотонно возрастающих ключах (например, ObjectId)?', 'Хэш-функция рассеивает последовательные значения по разным шардам', 'Хэш-шардирование объединяет все документы в один шард для простоты', 'Хэш-шардирование полностью отключает индексацию по shard key', 'Range-based шардирование уже само решает проблему hotspot', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Как хэш-шардирование в MongoDB решает проблему ''горячего'' шарда при монотонно возрастающих ключах (например, ObjectId)?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'В чём ключевое отличие организации кода в Vertical Slice Architecture от классической Onion-архитектуры?', 'Код группируется по фичам, а не по техническим слоям, как в Onion', 'Vertical Slice запрещает использование интерфейсов вообще', 'Onion-архитектура не поддерживает инверсию зависимостей', 'Vertical Slice — это просто другое название MVC-паттерна', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'В чём ключевое отличие организации кода в Vertical Slice Architecture от классической Onion-архитектуры?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Когда простого Factory Method недостаточно и требуется именно Abstract Factory?', 'Когда нужно создавать согласованные семейства связанных объектов вместе', 'Когда объект нужно создать только один раз за всё время работы', 'Когда создание объекта не требует выбора конкретной реализации', 'Когда объект не имеет вообще никаких зависимостей от других классов', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Когда простого Factory Method недостаточно и требуется именно Abstract Factory?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему чрезмерное использование Mock-объектов может привести к хрупким (brittle) тестам?', 'Тесты начинают проверять детали реализации, а не наблюдаемое поведение', 'Mock-объекты всегда работают медленнее реальных зависимостей', 'Stub и Fake запрещено использовать вместе с Mock в одном тесте', 'Mock автоматически удаляет тестовые данные после каждого запуска', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему чрезмерное использование Mock-объектов может привести к хрупким (brittle) тестам?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему gRPC плохо подходит для публичных API, потребляемых напрямую браузером без прокси?', 'Браузерный fetch/XHR не даёт контроля над gRPC HTTP/2-фреймами', 'Браузеры вообще не поддерживают протокол HTTP/2 в принципе', 'gRPC не умеет работать поверх бинарной сериализации Protocol Buffers', 'REST требует больше пропускной способности, чем gRPC в любом случае', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему gRPC плохо подходит для публичных API, потребляемых напрямую браузером без прокси?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему простое увеличение контекстного окна LLM не заменяет полностью подход RAG?', 'Растёт стоимость, задержка, а точность падает на длинном контексте', 'Контекстное окно вообще не влияет на стоимость запроса к модели', 'RAG работает только с моделями, не имеющими контекстного окна', 'Увеличение контекста полностью решает проблему актуальности данных', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему простое увеличение контекстного окна LLM не заменяет полностью подход RAG?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему rebase уже запушенной публичной ветки считается опасной операцией?', 'Коммиты получают новые хэши, история у других расходится', 'Rebase удаляет все коммиты веток без возможности восстановления', 'Merge и rebase создают абсолютно идентичную историю коммитов', 'Rebase запрещён технически для веток с более чем одним коммитом', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему rebase уже запушенной публичной ветки считается опасной операцией?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Как multi-stage build в Dockerfile уменьшает размер финального образа .NET-приложения?', 'В финал копируются только артефакты сборки, без SDK', 'Multi-stage build сжимает исходный код перед компиляцией', 'Multi-stage build автоматически удаляет неиспользуемые NuGet-пакеты', 'Финальный образ всегда собирается на основе SDK-образа целиком', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Как multi-stage build в Dockerfile уменьшает размер финального образа .NET-приложения?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Что произойдёт с hard link при удалении файла, на который он указывает, в отличие от symbolic link?', 'Данные останутся доступны, пока счётчик ссылок на inode не станет нулём', 'Hard link сразу же станет битым (dangling), как и symbolic link', 'Файл будет физически удалён вместе со всеми hard link на него', 'Hard link автоматически превратится в symbolic link после удаления', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Что произойдёт с hard link при удалении файла, на который он указывает, в отличие от symbolic link?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему HashSet<T> в худшем случае деградирует с O(1) до O(n) для Add/Contains?', 'Много элементов в одной корзине превращают поиск в перебор', 'HashSet в худшем случае вообще не поддерживает операцию Contains', 'LoadFactor всегда равен нулю, что делает поиск линейным всегда', 'HashSet использует B-Tree вместо хэш-таблицы для больших коллекций', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему HashSet<T> в худшем случае деградирует с O(1) до O(n) для Add/Contains?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему QuickSort часто предпочитают MergeSort на практике, несмотря на худший случай O(n²)?', 'Сортировка на месте, лучшая работа с кэшем и маловероятный худший случай', 'QuickSort гарантирует O(n log n) в любом случае в отличие от MergeSort', 'MergeSort вообще не применим к массивам, только к связным спискам', 'QuickSort требует больше памяти, чем MergeSort, но работает быстрее', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему QuickSort часто предпочитают MergeSort на практике, несмотря на худший случай O(n²)?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему подход через Signals обеспечивает более точечные обновления UI, чем Virtual DOM diffing в React?', 'Обновляются только узлы, зависящие от изменившегося Signal', 'Signals полностью отключают рендеринг компонентов при любых изменениях', 'Virtual DOM быстрее Signals при любых сценариях обновления UI', 'React вообще не выполняет diffing при изменении состояния', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему подход через Signals обеспечивает более точечные обновления UI, чем Virtual DOM diffing в React?');

INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
SELECT 'Hard', 'Почему DependencyProperty в WPF хранит значение не в обычном поле объекта, а в отдельной системе хранения?', 'Это экономит память и поддерживает приоритеты значений', 'Обычные поля в WPF в принципе запрещены компилятором', 'DependencyProperty хранится в реестре Windows, а не в памяти', 'Это нужно только для сериализации объекта в XAML-файл', 0
WHERE NOT EXISTS (SELECT 1 FROM Questions WHERE Text = 'Почему DependencyProperty в WPF хранит значение не в обычном поле объекта, а в отдельной системе хранения?');
