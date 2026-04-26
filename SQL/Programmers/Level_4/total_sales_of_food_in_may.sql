/*
Problem: 5월 식품들의 총매출 조회하기 (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/131117
Concept: JOIN, BETWEEN, GROUP BY, Aggregate Functions (SUM)

[Approach]
1. JOIN FOOD_PRODUCT and FOOD_ORDER tables using PRODUCT_ID.
2. Filter the rows where PRODUCE_DATE is in May 2022.
3. Group by PRODUCT_ID to calculate TOTAL_SALES using SUM(AMOUNT) * PRICE.
4. Order the result by TOTAL_SALES in descending order, then by PRODUCT_ID in ascending order.

[Retrospective]
Using SUM(AMOUNT) * PRICE is efficient and works perfectly in MySQL because PRICE is functionally dependent on the grouped PRODUCT_ID.
*/

SELECT 
    P.PRODUCT_ID,
    P.PRODUCT_NAME,
    SUM(AMOUNT) * PRICE AS TOTAL_SALES
FROM FOOD_PRODUCT AS P
INNER JOIN FOOD_ORDER AS O
ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE PRODUCE_DATE BETWEEN '2022-05-01' AND '2022-05-31'
GROUP BY P.PRODUCT_ID
ORDER BY TOTAL_SALES DESC, P.PRODUCT_ID ASC;