SELECT menu.id AS menu_id
FROM menu -- но уже из того, что будет отфильтровано из подзапроса
WHERE menu.id NOT IN ( -- отфильтруем те ид, которые НЕТ в подзапросе
    SELECT menu_id
    FROM person_order
)
ORDER BY menu_id;
/*найдем ид всех записей в меню, которые не были заказаны никем*/