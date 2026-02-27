/*
 * Problem: Remove Duplicates (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/59408
 * Concept: Aggregate Function (COUNT), DISTINCT

[Approach]
Use COUNT(DISTINCT NAME) to count unique animal names.
Explicitly filter out NULL values using the WHERE clause to match the requirement.
*/

SELECT COUNT(DISTINCT NAME) AS 'count'
FROM ANIMAL_INS
WHERE NAME IS NOT NULL;