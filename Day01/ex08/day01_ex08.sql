SELECT order_date,
       name || ' (age:' || age || ')' as person_information
FROM person_order
NATURAL JOIN (SELECT id AS person_id, name, age  FROM person) AS person
ORDER BY order_date, person_information
