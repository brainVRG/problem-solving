/*
 * Problem: Find Animals with the Same Name (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/59041
 * Concept: GROUP BY, HAVING, Aggregate Function
 *
 * [Approach]
 * 1. Exclude records where the name is NULL.
 * 2. Group the data by animal name.
 * 3. Use HAVING to filter names that appear 2 or more times.
 * 4. Sort the results alphabetically by name.
 */

SELECT NAME, COUNT(*) AS 'COUNT'
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
GROUP BY NAME 
HAVING COUNT(*) >= 2
ORDER BY NAME;