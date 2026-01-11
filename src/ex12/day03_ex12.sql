INSERT INTO person_order
SELECT 
generate_series( -- генерируем ид для заказов (с 23 по 31)
    (SELECT MAX(id) FROM person_order) + 1, -- начинаем от последнего(22) + 1 заказа, т.е. с 23-го
    (SELECT MAX(id) FROM person) + (SELECT MAX(id) FROM person_order), -- заканчиваем 23 + число персон заказом - т.е. 31-м
    1), -- переход на +1 шаг в итераии
generate_series( -- генерируем по порядку ид персон, сделавших заказы от 1 до 9
    (SELECT MIN(id) FROM person), -- от 1
    (SELECT MAX(id) FROM person), -- до 9
    1), -- +1 шаг в итерации
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'), -- получаем ид пиццерии
    '2022-02-25'; -- дата заказа
/*Новые заказы на греческую пиццу продолжают поступать и 25.02.2022
-- generate_series - сгенерирует последовательность чисел и ид клиентов*/
-- покажем, что все в порядке SELECT * FROM person_order
-- исправить DELETE FROM person_order WHERE order_date = '2022-02-25'