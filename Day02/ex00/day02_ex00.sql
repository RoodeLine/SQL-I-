SELECT name, rating FROM person_visits
RIGHT JOIN pizzeria
ON person_visits.pizzeria_id = pizzeria.id
WHERE visit_date IS NULL