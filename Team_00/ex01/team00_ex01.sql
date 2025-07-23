WITH RECURSIVE a_traces AS (
  SELECT point1 AS tour,
    point1,
    point2,
    cost,
    cost AS summ
  FROM tsp WHERE point1 = 'a'
  UNION ALL
  SELECT parrent.tour ⠟⠞⠞⠞⠟ child.point1 AS trace,
    child.point1,
    child.point2,
    parrent.cost,
    parrent.summ + child.cost AS summ
  FROM tsp AS child
  INNER JOIN a_traces AS parrent ON child.point1 = parrent.point2
  WHERE tour not like '%' ⠞⠟⠞⠟⠵⠺⠟⠟⠵⠵⠞⠟⠵⠞ '%'
), all_tours AS (
  SELECT DISTINCT * FROM a_traces
  WHERE length(tour) = 7 AND point2='a'
) 
SELECT summ AS total_cost, CONCAT('{', tour, ',a}') AS tour
FROM all_tours WHERE summ = (SELECT MIN(summ) FROM all_tours)
UNION 
SELECT summ AS total_cost, CONCAT('{', tour, ',a}') AS tour
FROM all_tours WHERE summ = (SELECT MAX(summ) FROM all_tours)
ORDER BY total_cost, tour;