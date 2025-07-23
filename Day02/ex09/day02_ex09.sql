WITH t1 AS (
    SELECT person.name AS person_name,
           address,
           gender,
           pizza_name
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
)
SELECT person_name
FROM t1
WHERE gender = 'female'
  AND pizza_name ='pepperoni pizza'
INTERSECT
SELECT person_name
FROM t1
WHERE gender = 'female'
  AND pizza_name = 'cheese pizza'
ORDER BY person_name