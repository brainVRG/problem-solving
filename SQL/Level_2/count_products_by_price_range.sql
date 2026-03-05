/*
 * Problem: Count Products by Price Range (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/131530
 * Concept: SELECT, GROUP BY, Aggregate Functions (COUNT), Numeric Functions (TRUNCATE), ORDER BY
 *
 * [Approach]
 * 1. Use the TRUNCATE() function with a precision of -4 to round down the PRICE to the nearest ten thousand, creating the price groups.
 * 2. Group the records by the truncated price group.
 * 3. Count the number of products in each group using COUNT(*).
 * 4. Sort the final results by the price group in ascending order.
 */

SELECT TRUNCATE(PRICE, -4) AS PRICE_GROUP, COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY TRUNCATE(PRICE, -4)
ORDER BY TRUNCATE(PRICE, -4) ASC;