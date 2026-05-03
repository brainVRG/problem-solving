/*
Problem: Find Customer Referee (Easy)
URL: https://leetcode.com/problems/find-customer-referee/
Concept: NULL Handling, WHERE Clause

[Approach]
1. Filter the Customer table using the WHERE clause.
2. Select the names where referee_id is explicitly NULL or not equal to 2.
*/

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2;