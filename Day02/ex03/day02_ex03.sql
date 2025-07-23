WITH md AS(
    SELECT missing_date::date
    FROM GENERATE_SERIES(
        '2022-01-01'::date,
        '2022-01-10'::date,
        interval '1 day')
        AS missing_date
    LEFT JOIN person_visits
        ON missing_date = visit_date
            AND (person_id = 1
            OR person_id = 2)
    WHERE person_id IS NULL
    )
SELECT * FROM md
