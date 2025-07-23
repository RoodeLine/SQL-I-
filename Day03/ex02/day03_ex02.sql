WITH
menu_pizzeria AS (
    SELECT pizza_name, price,
       pizzeria.name AS pizzeria_name
    FROM menu
    JOIN pizzeria
        ON pizzeria.id = menu.pizzeria_id),
menu_orders AS (
    SELECT pizza_name, price,
       pizzeria.name AS pizzeria_name
    FROM person_order
    JOIN menu
        ON menu.id = person_order.menu_id
    JOIN pizzeria
        ON pizzeria.id = menu.pizzeria_id)

SELECT * FROM menu_pizzeria
EXCEPT
SELECT * FROM menu_orders

ORDER BY 1, 2;
