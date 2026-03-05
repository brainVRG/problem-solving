/*
 * Problem: Find Number of Fish Caught by Fish Type (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/293257
 * Concept: JOIN, GROUP BY, Aggregate Functions (COUNT), ORDER BY
 *
 * [Approach]
 * 1. Join the FISH_INFO (I) and FISH_NAME_INFO (N) tables using their common key, FISH_TYPE.
 * 2. Group the joined records by FISH_NAME.
 * 3. Count the number of records in each group using COUNT(*) to find the total catch per fish type.
 * 4. Sort the results by the calculated FISH_COUNT in descending order.
 */

SELECT COUNT(*) AS FISH_COUNT, N.FISH_NAME AS FISH_NAME
FROM FISH_INFO AS I
LEFT JOIN FISH_NAME_INFO AS N
ON I.FISH_TYPE = N.FISH_TYPE
GROUP BY N.FISH_NAME
ORDER BY FISH_COUNT DESC;