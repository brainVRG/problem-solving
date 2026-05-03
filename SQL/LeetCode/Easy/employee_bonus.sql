/*
Problem: Employee Bonus (Easy)
URL: https://leetcode.com/problems/employee-bonus/
Concept: LEFT JOIN

[Approach]
1. Use a LEFT JOIN to combine the Employee table with the Bonus table based on empId, ensuring employees without a bonus are included.
2. Filter the results using the WHERE clause to select rows where the bonus is strictly less than 1000 or the bonus IS NULL.
*/

SELECT 
    E.name, 
    B.bonus
FROM Employee E
LEFT JOIN Bonus B
    ON E.empId = B.empId
WHERE B.bonus IS NULL OR B.bonus < 1000;