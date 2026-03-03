/*
 * Problem: Offline Sales by Product (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/131533
 * Concept: JOIN, GROUP BY, Aggregate Function with Arithmetic
 *
 * [Approach]
 * 1. INNER JOIN the OFFLINE_SALE (O) and PRODUCT (P) tables on their common key, PRODUCT_ID.
 * 2. Group the joined records by PRODUCT_CODE.
 * 3. Calculate total sales for each product by summing the product of PRICE and SALES_AMOUNT.
 * 4. Order the results by total sales in descending order, then by PRODUCT_CODE in ascending order.
 */

SELECT P.PRODUCT_CODE AS PRODUCT_CODE, SUM(P.PRICE * O.SALES_AMOUNT) AS SALES
FROM OFFLINE_SALE AS O
INNER JOIN PRODUCT AS P
ON O.PRODUCT_ID = P.PRODUCT_ID
GROUP BY P.PRODUCT_CODE
ORDER BY SALES DESC, PRODUCT_CODE ASC;