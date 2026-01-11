DELETE FROM person_order WHERE order_date = '2022-02-25';
DELETE FROM menu WHERE pizza_name = 'greek pizza';
/*жор от 25.02.22 оказался необоснованным, поэтому удалим все заказы*/
-- проверим, что все в порядке
-- SELECT * FROM person_order
-- SELECT * FROM menu