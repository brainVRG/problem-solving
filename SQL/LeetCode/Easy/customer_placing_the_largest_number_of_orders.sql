/*
Problem: Customer Placing the Largest Number of Orders (Easy)
URL: https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
Concept: GROUP BY, ORDER BY, LIMIT

[Approach]
1. Group the Orders table by customer_number to aggregate the orders for each customer.
2. Order the grouped results by the count of orders in descending order.
3. Use LIMIT 1 to return only the customer_number with the highest order count.
*/

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;