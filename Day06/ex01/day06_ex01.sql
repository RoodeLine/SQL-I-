INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT row_number() over () AS id, person_id, menu.pizzeria_id,
    CASE
        WHEN count(*) = 1 THEN 10.5
        WHEN count(*) = 2 THEN 22
        ELSE 30
    END discount
FROM person_order INNER JOIN menu ON menu.id = person_order.menu_id
GROUP BY person_id, menu.pizzeria_id;