/*
 * Problem: Total Order of Ice Cream by Ingredient (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/133026
 * Concept: JOIN, GROUP BY, Aggregate Function (SUM)
 *
 * [Approach]
 * 1. Perform an INNER JOIN between FIRST_HALF (F) and ICECREAM_INFO (I) on the common key 'FLAVOR'.
 * 2. Group the joined data by INGREDIENT_TYPE.
 * 3. Calculate the total order quantity for each ingredient type using SUM(TOTAL_ORDER).
 * 4. Sort the result by the aggregated total order in ascending order.
 */

SELECT I.INGREDIENT_TYPE AS INGREDIENT_TYPE, SUM(TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF AS F
INNER JOIN ICECREAM_INFO AS I
ON F.FLAVOR = I.FLAVOR
GROUP BY I.INGREDIENT_TYPE
ORDER BY TOTAL_ORDER ASC;