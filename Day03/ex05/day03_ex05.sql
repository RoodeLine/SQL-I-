WITH
Andrey_visit AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person_visits
    JOIN pizzeria
        ON pizzeria.id = person_visits.pizzeria_id
    JOIN person
        ON person.id = person_visits.person_id
    WHERE person.name = 'Andrey'),
Andrey_orders AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person_order
    JOIN person
        ON person_order.person_id = person.id
    JOIN menu
        ON menu.id = person_order.menu_id
    JOIN pizzeria
        ON pizzeria.id = menu.pizzeria_id
    WHERE person.name = 'Andrey')

SELECT * FROM Andrey_visit
EXCEPT
SELECT * FROM Andrey_orders

ORDER BY pizzeria_name;