WITH
female_order AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person
    JOIN person_order
        ON person.id = person_order.person_id
    JOIN menu
        ON menu.id = person_order.menu_id
    JOIN pizzeria
        ON menu.pizzeria_id = pizzeria.id
    WHERE person.gender = 'female'),
male_order AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person
    JOIN person_order
        ON person.id = person_order.person_id
    JOIN menu
        ON menu.id = person_order.menu_id
    JOIN pizzeria
        ON menu.pizzeria_id = pizzeria.id
    WHERE person.gender = 'male')

(SELECT * FROM female_order
EXCEPT
SELECT * FROM male_order)

UNION

(SELECT * FROM male_order
EXCEPT
SELECT * FROM female_order)

ORDER BY pizzeria_name