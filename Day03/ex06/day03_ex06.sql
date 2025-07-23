WITH pizza AS (
    SELECT pizzeria_id, pizzeria.name pizzeria_name, pizza_name, price
    FROM menu
    JOIN pizzeria
        ON menu.pizzeria_id = pizzeria.id)

SELECT p1.pizza_name,
       p1.pizzeria_name pizzeria_name_1,
       p2.pizzeria_name pizzeria_name_2,
       p1.price
FROM pizza p1
JOIN pizza p2
    ON p1.pizza_name = p2.pizza_name
    AND p1.pizzeria_id > p2.pizzeria_id
    AND p1.price = p2.price
ORDER BY pizza_name