/*
 * Problem: Count Cars with Specific Options (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/151137
 * Concept: Regular Expressions (REGEXP), GROUP BY, Aggregate Function
 *
 * [Approach]
 * 1. Use the REGEXP operator to filter cars that have at least one of the required options ('통풍시트', '열선시트', or '가죽시트').
 * 2. Group the filtered results by CAR_TYPE.
 * 3. Count the number of cars in each group using COUNT(*).
 * 4. Sort the final output by CAR_TYPE in ascending order.
 */

SELECT CAR_TYPE, COUNT(*) AS 'CARS'
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS REGEXP '통풍시트|열선시트|가죽시트'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;