-- SELECT CITY, LENGTH(CITY)
-- FROM STATION
-- ORDER BY LENGTH(CITY) ASC, CITY ASC 
-- LIMIT 1;

-- SELECT DISTINCT(CITY), LENGTH(CITY)
-- FROM STATION
-- ORDER BY LENGTH(CITY) DESC, CITY ASC
-- LIMIT 1;

-- CITY names starting with vowels 'a','e','i','o','u'

-- SELECT DISTINCT CITY
-- FROM STATION
-- WHERE LEFT(CITY,1) IN ('a','e','i','o','u');

-- SELECT DISTINCT CITY
-- FROM STATION
-- WHERE LEFT(CITY,1) IN ('a','e','i','o','u') AND RIGHT(CITY,1) IN ('a','e','i','o','u') ;


-- SELECT name
-- FROM Employee
-- WHERE salary > 2000 AND months < 10
-- ORDER BY employee_id ASC; 


-- Students who score 75, sort them by last 3 caracters in name and secondary sort them by ascending id
-- select name from students where marks > 75 order by right(name,3),id asc;

-- Naomi(P) 
-- Priya(D) 
-- Priyanka(P) 
-- Samantha(A) 
-- There are a total of 3 doctors. 
-- There are a total of 4 actors.

-- SELECT CONCAT(Name,'(',left(occupation,1),')') as NAME 
-- FROM OCCUPATIONS
-- ORDER BY NAME;

-- SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.') as TOTALS
-- FROM OCCUPATIONS
-- GROUP BY Occupation
-- ORDER BY TOTALS;      




