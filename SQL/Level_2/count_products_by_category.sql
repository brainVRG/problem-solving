/*
 * Problem: Count Products by Category (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/131529
 * Concept: String Function (SUBSTRING), GROUP BY, Aggregate Function
 *
 * [Approach]
 * Extract the first two characters of PRODUCT_CODE using SUBSTRING() to identify the category.
 * Group by this category code and use COUNT(*) to find the number of products per category.
 * Order the results by the category code in ascending order.
 */

SELECT SUBSTRING(PRODUCT_CODE, 1, 2) AS PRODUCT_CODE, COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY SUBSTRING(PRODUCT_CODE, 1, 2)
ORDER BY PRODUCT_CODE;