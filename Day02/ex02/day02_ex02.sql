SELECT coalesce(person.name, '-') AS person_name,
       pv.visit_date,
       coalesce(pizzeria.name, '-') AS pizzeria_name
FROM person
FULL JOIN
    (SELECT * from person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03')
    pv ON person.id = pv.person_id
FULL JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
ORDER BY 1,2,3