WITH female(pizzeria_name) AS ( -- создадим cte - временный подзапрос для основного запроса, чтобы выбрать названия пиццерий, посещенных женщинами
    SELECT pizzeria.name
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id -- получим названия пиццерий
    JOIN person ON person_visits.person_id = person.id -- имена и пол клиента
    WHERE person.gender = 'female' -- фильтруем женщин
),
male(pizzeria_name) AS ( -- второй временный подзапрос cte (common table expression), чтобы выбрать названия пиццерий, посещенных мужчинами
    SELECT pizzeria.name
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
    WHERE person.gender = 'male' -- фильтруем мужчин
),   
female_result(pizzeria_name) AS ( -- создаем дополнительный cte для пиццерий, которые посещались ТОЛЬКО женщинами
    SELECT pizzeria_name
    FROM female -- из cte женщин
    EXCEPT ALL -- и исключаем ВСЕ пиццерии, посещенные мужчинами
    SELECT pizzeria_name
    FROM male -- из cte мужчин
),   
male_result(pizzeria_name) AS ( -- создадим cte для пиццерий, которые посещались ТОЛЬКО мужчинами
    SELECT pizzeria_name
    FROM male
    EXCEPT ALL -- исключаем все пиццерии, которые посещались женщинами
    SELECT pizzeria_name
    FROM female
)
SELECT pizzeria_name -- основной запрос
FROM female_result -- более женские пиццерии Доминос и Папа Джонс (на самом деле - пиццерия, которые посещаются только женщинами в случае нашего запроса)
UNION ALL -- объединяем с полностью мужчими пиццериями (включая дубликаты)
SELECT pizzeria_name 
FROM male_result -- более мужская пиццерия Бест Пицца (пиццерия, посещаемая только мужчинами в случае нашего запроса)
ORDER BY pizzeria_name;
/*найдем пиццерии, которые чаще посещались женщинами или мужчинами*/
-- альтернативный вариант (и, наверное, более правильный)
/*WITH visit_counts AS (
    -- Подсчитываем количество посещений каждой пиццерии женщинами и мужчинами
    SELECT 
        pizzeria.name AS pizzeria_name,
        SUM(CASE WHEN person.gender = 'female' THEN 1 ELSE 0 END) AS female_visits, -- количество женских посещений
        SUM(CASE WHEN person.gender = 'male' THEN 1 ELSE 0 END) AS male_visits -- количество мужчких посещений
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
    GROUP BY pizzeria.name --группируем по названию пиццерии, чтобы для каждой из них получить количество посетителей - мужчин и женщин
)
SELECT pizzeria_name
-- Выбираем названия пиццерий
FROM visit_counts
WHERE female_visits > male_visits
   OR male_visits > female_visits
-- Выбираем только те пиццерии, где количество посещений от одного пола больше
ORDER BY pizzeria_name;*/
-- except all - выбирает все строки из первого набора данных, которых нет во втром (с сохранение дубликатов)
-- union all - нужен для объединения результатов двух и более селект в один общий результат, с сохранение всех строк, включая дубликаты