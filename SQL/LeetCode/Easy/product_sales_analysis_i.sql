/*
Problem: Product Sales Analysis I (Easy)
URL: https://leetcode.com/problems/product-sales-analysis-i/
Concept: INNER JOIN

[Approach]
1. Use an INNER JOIN to combine the Sales table and the Product table using product_id.
2. Select product_name from the Product table, and year and price from the Sales table.
*/

SELECT 
    P.product_name, 
    S.year, 
    S.price
FROM Sales S
INNER JOIN Product P
    ON S.product_id = P.product_id;