/*
Problem: Top 3 Flavors by Total Order (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/133027
Concept: UNION ALL, Inline View, GROUP BY, ORDER BY, LIMIT

[Approach]
1. Combine the FIRST_HALF and JULY tables using UNION ALL.
2. Group the combined data by FLAVOR.
3. Order the groups by the sum of TOTAL_ORDER in descending order.
4. Limit the result to 3 rows.
*/

SELECT FLAVOR
FROM 
    (
    SELECT *
    FROM FIRST_HALF H
    UNION ALL
    SELECT *
    FROM JULY J
    ) t
GROUP BY FLAVOR
ORDER BY SUM(TOTAL_ORDER) DESC
LIMIT 3;