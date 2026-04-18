/*
Problem: Find FrontEnd Developers (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/276035
Concept: Bitwise Operator, JOIN, GROUP BY

[Approach]
1. JOIN DEVELOPERS and SKILLCODES using the bitwise AND operator to match skills.
2. Filter records where CATEGORY is 'Front End'.
3. Use GROUP BY to deduplicate developers who possess multiple Front End skills.
4. Order the final result by ID in ascending order.

[Retrospective]
Using an `EXISTS` clause with a correlated subquery filters the developers without creating duplicates, eliminating the need for `GROUP BY`.
*/

SELECT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
FROM DEVELOPERS AS D
INNER JOIN SKILLCODES AS S
    ON (D.SKILL_CODE & S.CODE) = S.CODE
WHERE S.CATEGORY = 'Front End'
GROUP BY D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
ORDER BY D.ID;