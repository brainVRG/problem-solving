/*
 * Problem: Find Fish Count and Max Length by Condition (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/293259
 * Concept: GROUP BY, Aggregate Functions (COUNT, MAX, AVG), IFNULL, HAVING, ORDER BY
 *
 * [Approach]
 * 1. Select the required aggregate columns: COUNT(*) for the total number of fish and MAX(LENGTH) for the longest fish.
 * 2. Group the records by FISH_TYPE to calculate these metrics for each specific type of fish.
 * 3. Filter the grouped results using the HAVING clause to include only fish types where the average length is 33cm or more.
 * 4. Use IFNULL(LENGTH, 10) inside the AVG() function to treat any NULL lengths (which represent fish 10cm or smaller) as exactly 10cm for the average calculation.
 * 5. Sort the final results by FISH_TYPE in ascending order.
 */

SELECT 
    COUNT(*) AS FISH_COUNT,
    MAX(LENGTH) AS MAX_LENGTH,
    FISH_TYPE
FROM FISH_INFO
GROUP BY FISH_TYPE
HAVING AVG(IFNULL(LENGTH, 10)) >= 33 
ORDER BY FISH_TYPE ASC;