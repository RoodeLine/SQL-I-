SELECT P1.name, P2.name, P1.address
FROM person P1
JOIN person P2
   ON P1.id > P2.id
   AND P1.address = P2.address
ORDER BY 1,2,3