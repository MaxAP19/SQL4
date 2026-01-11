SELECT menu1.pizza_name, -- запрос работает со скопированными таблицами
       pizzeria1.name AS pizzeria_name_1,
       pizzeria2.name AS pizzeria_name_2, 
       menu1.price
FROM menu AS menu1
JOIN menu AS menu2 ON menu1.price = menu2.price -- объединяем меню по цене, чтобы найти пиццы с одинаковой ценой
JOIN pizzeria AS pizzeria1 ON pizzeria1.id = menu1.pizzeria_id -- соединяем таблицы меню с таблицей пиццерий для получения названия первой пиццерии
JOIN pizzeria AS pizzeria2 ON pizzeria2.id = menu2.pizzeria_id -- аналогично для двух других копий для получения названия второй пиццерии
WHERE menu1.id > menu2.id -- чтобы не было повторений одной и той же пары пиццерий
    AND menu1.pizza_name = menu2.pizza_name -- а у пицц - одинаковые названия
ORDER BY pizza_name;
/*найти одинаковые названия пицц с одинаковой ценой, но из разных пиццерий*/
-- копирование таблиц наше все!