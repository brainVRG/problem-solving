/*
 * Problem: Classify E. coli by Size 1 (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/299307
 * Concept: SELECT, CASE WHEN, ORDER BY
 *
 * [Approach]
 * 1. Select the ID column from the ECOLI_DATA table.
 * 2. Use a CASE statement to categorize the SIZE_OF_COLONY: 'LOW' if 100 or less, 'MEDIUM' if 1000 or less, and 'HIGH' for anything greater.
 * 3. Sort the final results by ID in ascending order.
 */

SELECT 
    ID,
    CASE
        WHEN SIZE_OF_COLONY <= 100 THEN 'LOW'
        WHEN SIZE_OF_COLONY <= 1000 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS 'SIZE'
FROM ECOLI_DATA
ORDER BY ID ASC;