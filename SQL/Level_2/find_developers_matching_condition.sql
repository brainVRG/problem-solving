/*
 * Problem: Find Developers Matching the Condition (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/276034
 * Concept: Bitwise Operators (&), Subquery, IN Operator, ORDER BY
 *
 * [Approach]
 * 1. Use a subquery to calculate the combined bitmask (SUM of codes) for 'C#' and 'Python'.
 * 2. Apply the bitwise AND operator (&) between the developer's SKILL_CODE and the combined bitmask.
 * 3. Filter the records where the bitwise AND result is greater than 0, indicating the presence of at least one target skill.
 * 4. Sort the final results by ID in ascending order.
 */

SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS
WHERE SKILL_CODE & (SELECT SUM(CODE) FROM SKILLCODES WHERE NAME IN ('C#', 'Python')) > 0
ORDER BY ID ASC;