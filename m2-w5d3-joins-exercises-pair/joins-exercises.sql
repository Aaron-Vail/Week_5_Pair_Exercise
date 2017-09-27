-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
-- (36 rows)
SELECT ci.name, co.name, ci.population
FROM country co 
JOIN city ci ON co.code = ci.countrycode
WHERE co.continent = 'Europe' AND ci.population > 1000000;

-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
-- (2 rows)
SELECT ci.name, co.name, ci.population
FROM country co 
JOIN city ci ON co.code = ci.countrycode
JOIN countrylanguage cl ON ci.countrycode = cl.countrycode
WHERE cl.language = 'French' AND ci.population > 1000000 AND isofficial = true;
-- 3. The name of the countries and continents where the language Javanese is spoken
-- (1 row)
SELECT co.name, co.continent
FROM country co 
JOIN countrylanguage cl ON co.code = cl.countrycode
WHERE cl.language = 'Javanese';
-- 4. The names of all of the countries in Africa that speak French as an official language
-- (5 row)
SELECT co.name
FROM country co 
JOIN countrylanguage cl ON co.code = cl.countrycode
WHERE cl.language = 'French' AND co.continent = 'Africa' AND isofficial = true;
-- 5. The average city population of cities in Europe
-- (average city population in Europe: 287,684)
SELECT  AVG(ci.population)
FROM country co 
JOIN city ci ON co.code = ci.countrycode
WHERE co.continent = 'Europe';
-- 6. The average city population of cities in Asia
-- (average city population in Asia: 395,019)
SELECT  AVG(ci.population)
FROM country co 
JOIN city ci ON co.code = ci.countrycode
WHERE co.continent = 'Asia';
-- 7. The number of cities in countries where English is an official language
-- (number of cities where English is official language: 523)
SELECT COUNT(ci.*)
FROM country co 
JOIN city ci ON co.code = ci.countrycode
JOIN countrylanguage cl ON ci.countrycode = cl.countrycode
WHERE cl.language = 'English' AND isofficial = true;
-- 8. The average population of cities in countries where the official language is English
-- (average population of cities where English is official language: 285,809)
SELECT AVG(ci.population)
FROM country co 
JOIN city ci ON co.code = ci.countrycode
JOIN countrylanguage cl ON ci.countrycode = cl.countrycode
WHERE cl.language = 'English' AND isofficial = true;
-- 9. The names of all of the continents and the population of the continent’s largest city
-- (6 rows, largest population for North America: 8,591,309)
SELECT  MAX(ci.population), co.continent
FROM country co 
JOIN city ci ON co.code = ci.countrycode
GROUP BY co.continent;
-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
-- (29 rows)
SELECT ci.name
FROM city ci
JOIN countrylanguage cl ON ci.countrycode = cl.countrycode
JOIN country co ON cl.countrycode = co.code
WHERE cl.isofficial = true AND ci.population > 1000000 AND co.continent = 'South America';
