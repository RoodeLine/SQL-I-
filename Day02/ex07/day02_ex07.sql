WITH Name_Pizza_Pizzeria AS (
     SELECT  visit_date,
             person.name AS persone_name,
             pizzeria.name AS pizzeria_name,
             price
     FROM person_visits
     JOIN person
         ON person_visits.person_id = person.id
     JOIN menu
         ON person_visits.pizzeria_id = menu.pizzeria_id
     JOIN pizzeria
         ON menu.pizzeria_id = pizzeria.id
     )
SELECT pizzeria_name
FROM Name_Pizza_Pizzeria
WHERE visit_date = '2022-01-08'
  AND persone_name = 'Dmitriy'
  AND price < 800