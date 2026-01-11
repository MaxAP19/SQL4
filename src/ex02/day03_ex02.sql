SELECT menu.pizza_name AS pizza_name,
    menu.price,
    pizzeria.name AS pizzeria_name
FROM menu
LEFT JOIN person_order ON menu.id = person_order.menu_id -- делаем левое соединение таблицы меню с таблицей заказов, что сохранить меню по которым не было заказо
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id -- а здесь достаточно обычного соединения, т.к. у всех меню есть и ид пиццерии
WHERE person_order.menu_id IS NULL -- оставим только те пиццы, которые не были заказаны
ORDER BY pizza_name, price; -- Сортирует результат по названию пиццы и цене
/*находим информацию о пиццах, которые не были заказаны,
а также информацию об их цене и пиццериях где они находится*/