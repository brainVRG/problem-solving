/*
Problem: Classify E. coli by Size 2 (Level 3)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/301649
Concept: Window Functions (NTILE), CASE WHEN, ORDER BY

[Approach]
1. Use NTILE(4) to divide the colonies into 4 quartiles based on SIZE_OF_COLONY (descending).
2. Map each quartile to its category ('CRITICAL', 'HIGH', 'MEDIUM', 'LOW') using CASE WHEN.
3. Sort the results by ID.

[Retrospective]
Calling the exact same `NTILE(4)` window function four times is an anti-pattern. Use `CASE NTILE(...) WHEN ... END` syntax or a CTE to evaluate it only once for better efficiency.
*/

SELECT 
    ID, 
    CASE 
        WHEN NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC) = 4 THEN 'LOW'
        WHEN NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC) = 3 THEN 'MEDIUM'
        WHEN NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC) = 2 THEN 'HIGH'
        WHEN NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC) = 1 THEN 'CRITICAL'
    END AS COLONY_NAME
FROM ECOLI_DATA
ORDER BY ID