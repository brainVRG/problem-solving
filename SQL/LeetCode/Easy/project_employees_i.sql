/*
Problem: Project Employees I (Easy)
URL: https://leetcode.com/problems/project-employees-i/
Concept: INNER JOIN, GROUP BY, AVG, ROUND

[Approach]
1. Use an INNER JOIN to combine the Project and Employee tables based on employee_id.
2. Group the result set by project_id.
3. Use the AVG() function to calculate the average experience years and the ROUND() function to round the result to 2 decimal places.
*/

SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
INNER JOIN Employee e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;