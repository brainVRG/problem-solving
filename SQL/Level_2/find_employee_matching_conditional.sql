/*
 * Problem: Find Employee Information that Matches the Condition (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/284527
 * Concept: INNER JOIN, WHERE, GROUP BY, Aggregate Functions (SUM), ORDER BY, LIMIT
 *
 * [Approach]
 * 1. Perform an INNER JOIN on HR_DEPARTMENT (D), HR_EMPLOYEES (E), and HR_GRADE (G) using their respective common keys, DEPT_ID and EMP_NO.
 * 2. Filter the evaluation records to include only those from the year 2022.
 * 3. Group the records by EMP_NO to aggregate the scores for each employee.
 * 4. Calculate the total annual score by summing the first and second half scores using the SUM() function.
 * 5. Sort the aggregated results by the total score in descending order.
 * 6. Use LIMIT 1 to retrieve only the top-scoring employee's information.
 */

SELECT SUM(SCORE) AS SCORE, E.EMP_NO AS EMP_NO, E.EMP_NAME AS EMP_NAME, E.POSITION AS POSITION, E.EMAIL AS EMAIL
FROM HR_DEPARTMENT AS D
INNER JOIN HR_EMPLOYEES AS E
ON D.DEPT_ID = E.DEPT_ID
INNER JOIN HR_GRADE AS G
ON E.EMP_NO = G.EMP_NO
WHERE G.YEAR = 2022
GROUP BY G.EMP_NO
ORDER BY SCORE DESC
LIMIT 1;