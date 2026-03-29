/*
Problem: Find the Biggest Fish by Type (Level 3)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/293261
Concept: INNER JOIN, Subquery, Multi-column IN Operator, GROUP BY, Aggregate Functions (MAX), ORDER BY

[Approach]
1. Use a subquery to find the maximum length (MAX(LENGTH)) for each fish type.
2. Perform an INNER JOIN between FISH_INFO and FISH_NAME_INFO to retrieve the corresponding fish names.
3. Filter the joined records using a multi-column IN operator to only include the rows where the fish type and length exactly match the subquery's max values.
4. Sort the final results by ID in ascending order to meet the problem's exact requirement.
*/

SELECT I.ID, N.FISH_NAME, I.LENGTH
FROM FISH_INFO AS I
INNER JOIN FISH_NAME_INFO AS N
ON I.FISH_TYPE = N.FISH_TYPE
WHERE (I.FISH_TYPE, I.LENGTH) IN (
    SELECT FISH_TYPE, MAX(LENGTH)
    FROM FISH_INFO
    GROUP BY FISH_TYPE
)
ORDER BY I.ID ASC;