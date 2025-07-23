SELECT person.name, menu.pizza_name, menu.price,
    (menu.price - (menu.price * person_discounts.discount/100)) AS discount_price, 
    pizzeria.name AS pizzeria_name
FROM person_order
    INNER JOIN menu ON menu.id = person_order.menu_id
    INNER JOIN person ON person.id = person_order.person_id
    INNER JOIN person_discounts ON person_discounts.pizzeria_id = menu.pizzeria_id AND person_discounts.person_id = person_order.person_id
    INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2;