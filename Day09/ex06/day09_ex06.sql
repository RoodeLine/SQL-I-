CREATE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08'
    )
RETURNS TABLE(name VARCHAR) AS $$
BEGIN
RETURN QUERY
    SELECT pizzeria.name AS pizzeria_name
    FROM menu 
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    JOIN person_visits ON menu.pizzeria_id = person_visits.pizzeria_id
    JOIN person ON person.id = person_visits.person_id
    WHERE price < pprice AND person.name = pperson AND visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');