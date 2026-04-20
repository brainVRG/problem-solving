/*
Problem: Categorize Developers (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/276036
Concept: Bitwise Operator, CTE, CASE, Cross Join

[Approach]
1. Create a CTE (SKILL_MASK) to calculate the aggregate bitmasks for 'Front End', 'Python', and 'C#'.
2. Cross join the DEVELOPERS table with the single-row SKILL_MASK CTE.
3. Use CASE statements with bitwise AND (&) operations to evaluate the SKILL_CODE against the pre-calculated masks and assign a GRADE.
4. Filter out developers with no applicable grade and order the results by GRADE (ASC) and ID (ASC).

[Retrospective]
1. Using `HAVING` without `GROUP BY` to filter aliases defined in the `SELECT` clause is a MySQL-specific extension. Wrapping the main query in an inline view or CTE and using `WHERE GRADE IS NOT NULL` complies with strict ANSI SQL standards and ensures portability across different database engines.
2. Using a comma `,` for joining tables (`FROM DEVELOPERS, SKILL_MASK`) is legacy syntax. Explicitly using `CROSS JOIN` is the standard practice to clarify the intent of generating a Cartesian product.
*/

WITH SKILL_MASK AS (
    SELECT
        SUM(CASE WHEN CATEGORY = 'Front End' THEN CODE ELSE 0 END) AS FE_MASK,
        SUM(CASE WHEN NAME = 'Python' THEN CODE ELSE 0 END) AS PYTHON_MASK,
        SUM(CASE WHEN NAME = 'C#' THEN CODE ELSE 0 END) AS CS_MASK
    FROM SKILLCODES
)

SELECT
    CASE
        WHEN (SKILL_CODE & FE_MASK) > 0 AND (SKILL_CODE & PYTHON_MASK) > 0 THEN 'A'
        WHEN (SKILL_CODE & CS_MASK) > 0 THEN 'B'
        WHEN (SKILL_CODE & FE_MASK) > 0 THEN 'C'
    END AS GRADE,
    ID,
    EMAIL
FROM DEVELOPERS, SKILL_MASK
HAVING GRADE IS NOT NULL
ORDER BY GRADE ASC, ID ASC;