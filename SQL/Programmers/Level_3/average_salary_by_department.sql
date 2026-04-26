/*
 * Problem: Average Salary by Department (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/284529
 * Concept: INNER JOIN, GROUP BY, Aggregate Functions (AVG), ROUND, ORDER BY
 *
 * [Approach]
 * 1. Perform an INNER JOIN between HR_DEPARTMENT (D) and HR_EMPLOYEES (E) using their common key, DEPT_ID.
 * 2. Group the records by both DEPT_ID and DEPT_NAME_EN to aggregate the salary data per department.
 * 3. Calculate the average salary using AVG(SAL) and round it to the nearest whole number using ROUND(..., 0).
 * 4. Sort the final results by the calculated average salary (AVG_SAL) in descending order.
*/

SELECT D.DEPT_ID, D.DEPT_NAME_EN, ROUND(AVG(SAL), 0) AS AVG_SAL
FROM HR_DEPARTMENT AS D
INNER JOIN HR_EMPLOYEES AS E
ON D.DEPT_ID = E.DEPT_ID
GROUP BY D.DEPT_ID, D.DEPT_NAME_EN
ORDER BY AVG_SAL DESC;
