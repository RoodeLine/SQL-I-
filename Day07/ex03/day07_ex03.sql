SELECT total1.name, COALESCE(total1.count,0) + COALESCE(total2.count,0) AS total_count
FROM
(SELECT pizzeria.name, COUNT(*) AS count
FROM person_visits INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY pizzeria.name) AS total1
FULL JOIN
(SELECT pizzeria.name, COUNT(*) AS count
 FROM person_order INNER JOIN menu ON menu.id = person_order.menu_id INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name) AS total2 ON total1.name = total2.name
ORDER BY 2 DESC, 1;