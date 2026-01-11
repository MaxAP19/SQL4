INSERT INTO person_order
VALUES (
    (SELECT MAX(id) + 1 FROM person_order),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
    '2022-02-24'
);
INSERT INTO person_order
VALUES (
    (SELECT MAX(id) + 1 FROM person_order),
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
    '2022-02-24'
);
/*у Дениса и Ирины произошел стрессовый зажор 24.02.2024 и
они заказали сицилийскую пиццу. Добавим инфу в заказы персон*/
-- SELECT * FROM person_order - покажем, что все в порядке
-- если не все в порядке - DELETE FROM person_order WHERE order_date = '2022-02-24'