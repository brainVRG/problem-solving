/*
Problem: Sales Analysis III (Easy)
URL: https://leetcode.com/problems/sales-analysis-iii/
Concept: Subquery, NOT IN, INNER JOIN

[Approach]
1. Use a subquery to find all product_ids that were sold outside the first quarter of 2019 (before '2019-01-01' or after '2019-03-31').
2. Filter the main Product table to select products whose product_id is NOT IN the subquery result.
*/

SELECT product_id, product_name
FROM Product
WHERE product_id NOT IN (
    SELECT p.product_id
    FROM Product p
    INNER JOIN Sales s
        ON p.product_id = s.product_id
    WHERE s.sale_date < '2019-01-01' OR s.sale_date > '2019-03-31'
);