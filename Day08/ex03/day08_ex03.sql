--S1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--S2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--S1
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';

--S2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;                                                   

--S1
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';

--S2
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';