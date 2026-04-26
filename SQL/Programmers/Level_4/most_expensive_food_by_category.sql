/*
Problem: Retrieve the Most Expensive Food by Category (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/131116
Concept: Inline View (Subquery), Window Function (ROW_NUMBER), IN Operator, ORDER BY

[Approach]
1. Use an inline view to filter specific categories ('과자', '국', '김치', '식용유').
2. Apply the ROW_NUMBER() window function partitioned by CATEGORY and ordered by PRICE in descending order to rank the items by price within each category.
3. In the main query, filter the rows where the rank (PriceRank) is 1 to get the most expensive item per category.
4. Order the final results by MAX_PRICE in descending order.

[Retrospective]
Using ROW_NUMBER() is a highly effective way to solve the "group-wise maximum" problem. It cleanly resolves the issue of matching non-aggregated columns (like PRODUCT_NAME) with the max value, which is often problematic and causes arbitrary row fetching when using a simple GROUP BY with MAX().
*/

SELECT
    CATEGORY,
    PRICE AS MAX_PRICE,
    PRODUCT_NAME
FROM
    (SELECT
        CATEGORY,
        PRICE,
        PRODUCT_NAME,
        ROW_NUMBER() OVER(PARTITION BY CATEGORY ORDER BY PRICE DESC) AS PriceRank
    FROM FOOD_PRODUCT
    WHERE CATEGORY IN ('과자', '국', '김치', '식용유')) t
WHERE PriceRank = 1
ORDER BY MAX_PRICE DESC;