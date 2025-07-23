WITH Name_Pizza_Pizzeria AS (
     SELECT person.name AS person_name,
            pizza_name,
            pizzeria.name AS pizzeria_name
     FROM person_order
     JOIN person
         ON person_order.person_id = person.id
     JOIN menu
         ON person_order.menu_id = menu.id
     JOIN pizzeria
         ON menu.pizzeria_id = pizzeria.id
)
SELECT pizza_name,
       pizzeria_name
FROM Name_Pizza_Pizzeria
WHERE person_name
          IN ('Denis', 'Anna')
ORDER BY pizza_name,
         pizzeria_name