WITH female(pizzeria_name) AS ( -- выбираем пиццерии, где заказывали женщины
    SELECT pizzeria.name AS pizzeria_name
    FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id
    WHERE person.gender = 'female'
),
male(pizzeria_name)AS ( -- выбираем пиццерии, в которых заказывали мужчины
    SELECT pizzeria.name AS pizzeria_name
    FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id
    WHERE person.gender = 'male'
),   
female_result(pizzeria_name) AS ( -- выбираем пиццерии в которых заказывали только женщины
    SELECT pizzeria_name
    FROM female
    EXCEPT -- чтобы получить уникальные строки из первого запроса которых нет во втром
    SELECT pizzeria_name
    FROM male
),
male_result(pizzeria_name) AS ( -- выбираем пиццерии, в которых заказывали только мужчниы
    SELECT pizzeria_name
    FROM male
    EXCEPT -- аналогично см. выше
    SELECT pizzeria_name
    FROM female
) -- объединяем пиццерии в которых был заказ только одним полом - женским или мужским
SELECT pizzeria_name
FROM female_result
UNION -- объединим результаты запроса оставив только уникальные сроки
SELECT pizzeria_name
FROM male_result
ORDER BY pizzeria_name;
/*найдем названия пиццерий, которые посещали только мужчины или только женщины*/
-- Папа Джонс - пицца сильных и независимых
-- except - для сравнения результатов селект-запросов и возврата всех строк первого запроса, котрых нет во втром - без дубликатов!
-- union для объединения результатов двух или более селект-запросов, возврат объединенного результата, включая дубликаты