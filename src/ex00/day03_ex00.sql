SELECT menu.pizza_name AS pizza_name,
    menu.price,
    pizzeria.name AS pizzeria_name,
    person_visits.visit_date
FROM person_visits -- работаем основной, а с ней, посредством джойнов и общих полей и соединяем другие таблиц ко всем полям которых и получаем доступ
JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
JOIN person ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE person.name = 'Kate' AND (price BETWEEN 800 AND 1000) -- отфильтруем
ORDER BY pizza_name, price, pizzeria_name
/*чтобы извлечь информацию, какие пиццы ела Катюшка, в какие
даты, в каких пиццериях и чтобы цена была от 800 до 1000*/