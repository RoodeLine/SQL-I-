SELECT missing_date::date
FROM GENERATE_SERIES('2022-01-01','2022-01-10', interval '1 day')
AS missing_date
LEFT JOIN person_visits ON missing_date = person_visits.visit_date
                               AND (person_visits.person_id = 1
                               OR person_visits.person_id = 2)
WHERE person_visits.person_id IS NULL





