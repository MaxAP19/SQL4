SELECT pizzeria.name AS pizzeria_name -- выберем имена всех пиццерий, которые посетил Андрей
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Andrey'
EXCEPT -- делаем исключение без дубликатов тех пиццерий, в которых Андрей сделал заказ
SELECT pizzeria.name
FROM menu
JOIN person_order ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person ON person_order.person_id = person.id
WHERE person.name = 'Andrey'
ORDER BY pizzeria_name;
/*пиццерии, которые посетил Андрей, но не сделал там заказ*/