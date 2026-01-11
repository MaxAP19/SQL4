INSERT INTO menu -- добавляем новую запись в таблицу
VALUES ( -- определим значения
    (SELECT MAX(id) + 1 FROM menu), -- найдем тот ид, котоорый мы должны присвоить пицце
    (SELECT id FROM pizzeria WHERE name = 'Dominos'), -- найдем ид нужно пиццерии
    'sicilian pizza', 900 -- название и цена
);
/*динамически добавим в таблицу меню новую пиццу по цене 900 руб
в пиццерию Доминос*/
-- чтобы проверить что все в порядке SELECT * FROM menu
-- SELECT * FROM pizzeria найти ид пиццерии
