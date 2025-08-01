SELECT (SELECT name FROM person p WHERE p.id = pv.person_id) AS person_name,
       (SELECT name FROM pizzeria p WHERE p.id = pv.pizzeria_id) AS pizzeria_name
FROM (SELECT * FROM person_visits pv WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv
ORDER BY person_name ASC, pizzeria_name DESC