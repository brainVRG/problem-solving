/*
Problem: Find Endangered E. coli (Level 5)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/301651
Concept: Recursive CTE, Hierarchical Data, Subquery (NOT IN), GROUP BY

[Approach]
1. Use a Recursive CTE (GEN) to compute the generation level for each E. coli ID.
2. In the main query, filter for leaf nodes (organisms with no children) by excluding IDs that exist as a PARENT_ID using a NOT IN subquery.
3. Group the remaining leaf node records by GENERATION.
4. Count the records per generation and order by GENERATION in ascending order.

[Retrospective]
Using a `NOT IN` subquery that queries the CTE again incurs unnecessary overhead. For large-scale data, implementing an Anti-Join using a `LEFT JOIN` against the base `ECOLI_DATA` table (where the joined child ID `IS NULL`) or using `NOT EXISTS` is the standard optimization to reduce execution time.
*/

WITH RECURSIVE GEN AS (
    SELECT 
        ID, 
        PARENT_ID,
        1 AS GENERATION
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
    UNION ALL
    SELECT
        E.ID,
        E.PARENT_ID,
        GEN.GENERATION + 1 AS GENERATION
    FROM GEN
    INNER JOIN ECOLI_DATA AS E
        ON E.PARENT_ID = GEN.ID
)

SELECT 
    COUNT(*) AS COUNT,
    GENERATION
FROM GEN
WHERE ID NOT IN (SELECT PARENT_ID FROM GEN WHERE PARENT_ID IS NOT NULL)
GROUP BY GENERATION
ORDER BY GENERATION ASC;