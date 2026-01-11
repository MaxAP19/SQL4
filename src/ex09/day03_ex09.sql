INSERT INTO person_visits -- добавляем запись
VALUES ( -- данные ид, имя, пиццерия, дата
    (SELECT MAX(id) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'
);
INSERT INTO person_visits
VALUES (
    (SELECT MAX(id) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'
);
/*добавим новые визиты в пиццерию Доминос Денисом и Ириной
24.02.2022*/
-- сделать рефреш
-- проверить, что все в порядке SELECT * FROM person_visits
-- на случай если что-то пойдет не так DELETE FROM person_visits WHERE visit_date = '2022-02-24'