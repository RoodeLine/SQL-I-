WITH
female_visit AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person
    JOIN person_visits
        ON person.id = person_visits.person_id
    JOIN pizzeria
        ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.gender = 'female'),
male_visit AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person
    JOIN person_visits
        ON person.id = person_visits.person_id
    JOIN pizzeria
        ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.gender = 'male')

(SELECT * FROM female_visit
EXCEPT ALL
SELECT * FROM male_visit)

UNION ALL

(SELECT * FROM male_visit
EXCEPT ALL
SELECT * FROM female_visit)

ORDER BY pizzeria_name