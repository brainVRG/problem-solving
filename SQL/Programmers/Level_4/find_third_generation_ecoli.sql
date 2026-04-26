/*
Problem: Find Specific Generation of E. coli (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/301650
Concept: Nested Subquery, Hierarchical Data

[Approach]
1. Identify the 1st generation by finding records where PARENT_ID IS NULL.
2. Identify the 2nd generation by matching PARENT_ID to the 1st generation IDs using a subquery.
3. Identify the 3rd generation by matching PARENT_ID to the 2nd generation IDs using another nested subquery.
4. Order the final IDs in ascending order.

[Retrospective]
For querying hierarchical data with variable or deep levels, using a Recursive CTE (`WITH RECURSIVE`) or explicit `INNER JOIN`s is the standard approach for better scalability and maintainability.
*/

SELECT ID
FROM ECOLI_DATA
WHERE PARENT_ID IN
    (
    SELECT ID
    FROM ECOLI_DATA
    WHERE PARENT_ID IN
        (
        SELECT ID
        FROM ECOLI_DATA
        WHERE PARENT_ID IS NULL
        )
    )
ORDER BY ID ASC;