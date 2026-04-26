/*
Problem: Count Adoptions by Hour (2) (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/59413
Concept: Recursive CTE, LEFT JOIN, Date Function (HOUR), GROUP BY

[Approach]
1. Use a Recursive CTE (ALL_HOUR) to generate rows for hours 0 through 23.
2. LEFT JOIN the generated hours with the ANIMAL_OUTS table by matching the hour extracted from DATETIME.
3. Group the result by the generated hour and count the ANIMAL_IDs to include hours with 0 adoptions.
4. Order the final result by hour in ascending order.

[Retrospective]
Using the `HOUR()` function on the right side of the `LEFT JOIN` condition (`HOUR(AO.DATETIME)`) causes a full table scan on `ANIMAL_OUTS`. For large datasets, pre-aggregating the counts per hour from `ANIMAL_OUTS` in a separate CTE or inline view before performing the `LEFT JOIN` drastically reduces join cardinality and execution time.
*/

WITH RECURSIVE ALL_HOUR AS (
    SELECT 0 AS HOUR
    UNION ALL
    SELECT HOUR + 1 AS h
    FROM ALL_HOUR
    WHERE HOUR < 23
)

SELECT AH.HOUR AS HOUR, COUNT(AO.ANIMAL_ID) AS COUNT
FROM ALL_HOUR AS AH
LEFT JOIN ANIMAL_OUTS AS AO 
ON AH.HOUR = HOUR(AO.DATETIME)
GROUP BY AH.HOUR
ORDER BY AH.HOUR;