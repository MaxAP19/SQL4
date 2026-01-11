UPDATE menu
SET price = price * 0.9
WHERE pizza_name = 'greek pizza'
/*сделаем скидку 10% на греческую пиццу*/
-- что все в порядке SELECT * FROM menu