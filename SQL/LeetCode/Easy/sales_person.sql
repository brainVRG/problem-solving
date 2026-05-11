/*
Problem: Sales Person (Easy)
URL: https://leetcode.com/problems/sales-person/
Concept: Subquery, NOT IN, INNER JOIN

[Approach]
1. Use a subquery to find the sales_id of all salespersons who have orders related to the company named 'RED'.
2. Join the Company and Orders tables in the subquery to link the company name with the sales_id.
3. Filter the main SalesPerson table to select names whose sales_id is NOT IN the subquery result.
*/

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT O.sales_id
    FROM Company C
    INNER JOIN Orders O
        ON C.com_id = O.com_id
    WHERE C.name = 'RED'
);