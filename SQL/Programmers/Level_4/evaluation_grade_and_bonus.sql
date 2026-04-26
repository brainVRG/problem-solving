/*
Problem: Evaluation Grade and Bonus (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/284528
Concept: JOIN, GROUP BY, Aggregate Function (AVG), CASE

[Approach]
1. JOIN HR_EMPLOYEES and HR_GRADE on EMP_NO.
2. Group by EMP_NO and EMP_NAME to calculate the annual average score.
3. Use CASE statements with AVG(SCORE) to determine GRADE and BONUS based on E.SAL.
4. Order by EMP_NO in ascending order.

[Retrospective]
1. Repeatedly calculating `AVG(G.SCORE)` across multiple `WHEN` clauses causes redundant overhead. Pre-calculating the average score in a CTE (WITH clause) or Inline View improves efficiency.
*/

SELECT 
    E.EMP_NO,
    E.EMP_NAME,
    CASE
        WHEN AVG(G.SCORE) >= 96 THEN 'S'
        WHEN AVG(G.SCORE) >= 90 THEN 'A'
        WHEN AVG(G.SCORE) >= 80 THEN 'B'
        ELSE 'C'
    END AS GRADE,
    CASE
        WHEN AVG(G.SCORE) >= 96 THEN E.SAL * 0.2
        WHEN AVG(G.SCORE) >= 90 THEN E.SAL * 0.15
        WHEN AVG(G.SCORE) >= 80 THEN E.SAL * 0.1
        ELSE 0
    END AS BONUS
FROM HR_EMPLOYEES AS E
INNER JOIN HR_GRADE AS G
    ON E.EMP_NO = G.EMP_NO
GROUP BY E.EMP_NO, E.EMP_NAME
ORDER BY E.EMP_NO ASC;