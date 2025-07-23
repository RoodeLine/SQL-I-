SELECT pizza_name, price, p.name, visit_date FROM menu
JOIN pizzeria p on menu.pizzeria_id = p.id
JOIN person_visits pv on menu.pizzeria_id = pv.pizzeria_id
JOIN person p2 on p2.id = pv.person_id
WHERE p2.name = 'Kate' AND price BETWEEN 800 AND 1000
ORDER BY 1,2,3