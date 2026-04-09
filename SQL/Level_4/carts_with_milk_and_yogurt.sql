/*
Problem: carts_with_milk_and_yogurt (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/62284
Concept: Self JOIN, DISTINCT

[Approach]
1. Self-join the CART_PRODUCTS table on CART_ID.
2. Filter the rows where table A contains 'Milk' and table B contains 'Yogurt'.
3. Use DISTINCT to retrieve unique CART_IDs and order them in ascending order.

[Retrospective]
Self-joining can cause a Cartesian product explosion if a single cart has multiple 'Milk' and 'Yogurt' entries. For larger datasets, using `WHERE NAME IN ('Milk', 'Yogurt') GROUP BY CART_ID HAVING COUNT(DISTINCT NAME) = 2` avoids self-joins and improves performance.
*/

SELECT DISTINCT A.CART_ID
FROM CART_PRODUCTS A
INNER JOIN CART_PRODUCTS B ON A.CART_ID = B.CART_ID
WHERE A.NAME = 'Milk' AND B.NAME = 'Yogurt'
ORDER BY A.CART_ID ASC;