--S1
SHOW TRANSACTION ISOLATION LEVEL;

--S2
SHOW TRANSACTION ISOLATION LEVEL;

--S1
BEGIN;

--S2
BEGIN;

--S1
SELECT 
  name, 
  rating 
FROM 
  pizzeria 
WHERE 
  name = 'Pizza Hut';

--S2
SELECT 
  name, 
  rating 
FROM 
  pizzeria 
WHERE 
  name = 'Pizza Hut';

--S1
UPDATE 
  pizzeria 
SET 
  rating = 4 
WHERE 
  name = 'Pizza Hut';

--S2
UPDATE 
  pizzeria 
SET 
  rating = 3.6 
WHERE 
  name = 'Pizza Hut';

--S1
COMMIT;

--S2
COMMIT;

--S1
SELECT 
  name, 
  rating 
FROM 
  pizzeria 
WHERE 
  name = 'Pizza Hut';

--S2
SELECT 
  name, 
  rating 
FROM 
  pizzeria 
WHERE 
  name = 'Pizza Hut';