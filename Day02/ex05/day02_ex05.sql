WITH FOR25 AS (
    SELECT name
    FROM person
    WHERE gender = 'female'
      AND age > 25
    ORDER BY name
)
SELECT * FROM FOR25