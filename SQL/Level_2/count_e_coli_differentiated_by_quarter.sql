/*
 * Problem: Count the Number of E. coli Differentiated by Quarter (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/299308
 * Concept: SELECT, CASE WHEN, Date Functions (MONTH), GROUP BY, Aggregate Functions (COUNT), ORDER BY
 *
 * [Approach]
 * 1. Use the MONTH() function to extract the month from DIFFERENTIATION_DATE.
 * 2. Categorize each month into its corresponding quarter ('1Q', '2Q', '3Q', '4Q') using a CASE statement.
 * 3. Group the records by the newly defined QUARTER.
 * 4. Count the total number of E. coli differentiated in each quarter using COUNT(*).
 * 5. Sort the final results by QUARTER in ascending order.
 *
 * [Retrospective]
CONCAT(QUARTER(DIFFERENTIATION_DATE), 'Q')
 */

SELECT
    CASE
        WHEN MONTH(DIFFERENTIATION_DATE) <= 3 THEN '1Q'
        WHEN MONTH(DIFFERENTIATION_DATE) <= 6 THEN '2Q'
        WHEN MONTH(DIFFERENTIATION_DATE) <= 9 THEN '3Q'
        WHEN MONTH(DIFFERENTIATION_DATE) <= 12 THEN '4Q'
    END AS QUARTER,
    COUNT(*) AS ECOLI_COUNT
FROM ECOLI_DATA
GROUP BY QUARTER
ORDER BY QUARTER ASC;