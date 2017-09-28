
-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)

BEGIN TRANSACTION;

INSERT INTO city (id, name, countrycode, district, population) 
VALUES (4080, 'Smallville', 'USA', 'Kansas', 45001);

COMMIT;

ROLLBACK;

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.

BEGIN TRANSACTION;

INSERT INTO countrylanguage (countrycode, language, isofficial, percentage) VALUES ('USA', 'Kryptonese', false, 0.0001);

COMMIT;

ROLLBACK;

-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.

BEGIN TRANSACTION;
UPDATE countrylanguage SET language = 'Krypto-babble'
WHERE language = 'Kryptonese';

COMMIT;

ROLLBACK;


-- 4. Set the US captial to Smallville, Kansas in the country table.

BEGIN TRANSACTION;

UPDATE country SET capital = 4080
WHERE code = 'USA';

COMMIT;

ROLLBACK;
-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

DELETE FROM city 
WHERE id = 4080;

--delete on table "city" violates foreign key constraint "country_capital_fkey" on table "country"


-- 6. Return the US captial to Washington.

BEGIN TRANSACTION;

UPDATE country SET capital = 3813
WHERE code = 'USA';


COMMIT;

ROLLBACK;
-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

BEGIN TRANSACTION;

DELETE FROM city 
WHERE id = 4080;

-- YES, the ID for Smallville was no longer listed as a capital foreign key.
COMMIT;

ROLLBACK;
-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)
BEGIN TRANSACTION;
UPDATE countrylanguage
SET isofficial = (CASE isofficial WHEN true THEN false ELSE true END) 
FROM country
WHERE indepyear BETWEEN 1801 AND 1971 
AND country.code = countrylanguage.countrycode;

COMMIT;

ROLLBACK;
-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4079 rows affected)
BEGIN TRANSACTION;

UPDATE city SET population = CEILING(population / 1000.0); 

COMMIT;

ROLLBACK;
-- 10. Assuming a country's surfacearea is expressed in miles, convert it to 
-- meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)
BEGIN TRANSACTION;

UPDATE country
SET surfacearea = surfacearea*2590000
FROM countrylanguage 
WHERE countrylanguage.language = 'French' AND countrylanguage.percentage > 20.0
AND country.code = countrylanguage.countrycode;

COMMIT;

ROLLBACK;