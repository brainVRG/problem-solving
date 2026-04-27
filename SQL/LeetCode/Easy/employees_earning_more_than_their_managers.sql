/*
Problem: Employees Earning More Than Their Managers (Easy)
URL: https://leetcode.com/problems/employees-earning-more-than-their-managers/
Concept: INNER JOIN (Self Join)

[Approach]
1. Use an INNER JOIN to self-join the Employee table, matching the employee's managerId with the manager's id.
2. Filter the result to select only the employees whose salary is strictly greater than their manager's salary.
*/

SELECT 
    E.name AS Employee
FROM Employee AS E
INNER JOIN Employee AS M
    ON E.managerId = M.id
WHERE E.salary > M.salary;