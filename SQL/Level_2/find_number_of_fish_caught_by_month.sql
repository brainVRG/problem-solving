/*
 * Problem: Find the Number of Fish Caught by Month (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/293260
 * Concept: SELECT, GROUP BY, Aggregate Functions (COUNT), Date Functions (MONTH), ORDER BY
 *
 * [Approach]
 * 1. Extract the numeric month from the TIME column using the MONTH() function.
 * 2. Group the records by the extracted month.
 * 3. Count the total number of records for each month using COUNT(*).
 * 4. Sort the final results by the extracted month in ascending order.
 */

SELECT COUNT(*) AS FISH_COUNT, MONTH(TIME) AS MONTH
FROM FISH_INFO
GROUP BY MONTH(TIME)
ORDER BY MONTH ASC;