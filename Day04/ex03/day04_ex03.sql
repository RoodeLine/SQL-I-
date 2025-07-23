SELECT generated_date AS missing_date
FROM v_generated_dates
WHERE generated_date
    BETWEEN '2021-12-31'
    AND '2022-02-01'
EXCEPT
SELECT visit_date
FROM person_visits
ORDER BY missing_date
