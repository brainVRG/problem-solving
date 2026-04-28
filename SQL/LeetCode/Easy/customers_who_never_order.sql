/*
Problem: Customers Who Never Order (Easy)
URL: https://leetcode.com/problems/customers-who-never-order/
Concept: Subquery, NOT IN

[Approach]
1. Use a subquery to retrieve all customerIds that exist in the Orders table.
2. Filter the Customers table to select the names of customers whose id is NOT IN the subquery result.
*/

SELECT name AS Customers
FROM Customers
WHERE id NOT IN (
    SELECT customerId
    FROM Orders
);