-- Шаблон для наполнения таблицы Questions реальными вопросами.
-- CorrectOptionIndex: 0 = OptionA, 1 = OptionB, 2 = OptionC, 3 = OptionD
-- Difficulty (регистр важен, должен точно совпадать): Easy / Medium / Hard
-- Требуется по 20 вопросов на каждую сложность.

-- Пример:
-- INSERT INTO Questions (Difficulty, Text, OptionA, OptionB, OptionC, OptionD, CorrectOptionIndex)
-- VALUES ('Easy', 'Какое ключевое слово объявляет неизменяемую переменную в C#?', 'var', 'const', 'readonly', 'static', 1);
