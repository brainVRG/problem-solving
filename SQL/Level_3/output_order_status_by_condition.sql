/*
 * Problem: Output Order Status Classified by Condition (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/131113
 * Concept: SELECT, DATE_FORMAT, CASE WHEN, IS NULL, ORDER BY
 *
 * [Approach]
 * 1. Select the required columns: ORDER_ID and PRODUCT_ID.
 * 2. Format the OUT_DATE as 'YYYY-MM-DD' using the DATE_FORMAT() function.
 * 3. Use a CASE statement to determine the shipping status: '출고완료' if OUT_DATE is on or before '2022-05-01', '출고미정' if OUT_DATE is NULL, and '출고대기' for the rest.
 * 4. Sort the final results by ORDER_ID in ascending order.
 */

SELECT 
    ORDER_ID, 
    PRODUCT_ID, 
    DATE_FORMAT(OUT_DATE, '%Y-%m-%d') OUT_DATE,
    CASE
        WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
        WHEN OUT_DATE IS NULL THEN '출고미정'
        ELSE '출고대기'
    END 출고여부
FROM FOOD_ORDER
ORDER BY ORDER_ID ASC;