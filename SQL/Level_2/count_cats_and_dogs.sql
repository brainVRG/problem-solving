/*
 * Problem: Count Cats and Dogs (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/59040
 * Concept: GROUP BY, Aggregate Function, Exact Matching (IN)
 *
 * [Approach]
 * 1. Filter the rows to include only exact matches for 'Cat' or 'Dog' using the IN operator.
 * 2. Group the filtered data by ANIMAL_TYPE.
 * 3. Count the number of animals for each type using COUNT(*).
 * 4. Sort the result alphabetically by ANIMAL_TYPE ascendingly to guarantee 'Cat' comes before 'Dog'.
 */

SELECT ANIMAL_TYPE, COUNT(*) AS 'count'
FROM ANIMAL_INS
WHERE ANIMAL_TYPE IN ('Cat', 'Dog')
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE ASC;