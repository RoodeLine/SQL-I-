SELECT  visit_date AS action_date,
       (SELECT name FROM person WHERE person.id = person_visits.person_id) AS person_name
FROM person_visits
INTERSECT
SELECT order_date, (SELECT name FROM person WHERE person.id = person_order.person_id) FROM person_order
ORDER BY 1, 2 DESC
