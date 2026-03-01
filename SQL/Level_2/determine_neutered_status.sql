/*
 * Problem: Determine Neutered Status (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/59409
 * Concept: String Matching, Conditional Statements (CASE WHEN)
 *
 * [Approach]
 * Use a CASE WHEN statement combined with the LIKE operator to check the SEX_UPON_INTAKE column.
 * If the string contains 'Neutered' or 'Spayed', assign 'O'. Otherwise, assign 'X'.
 * Sort the output by ANIMAL_ID in ascending order.
 *
 * [Retrospective]
 * While using multiple LIKE conditions works perfectly, MySQL supports Regular Expressions 
 * via the REGEXP operator, which can make the query much more concise.
 * For example: CASE WHEN SEX_UPON_INTAKE REGEXP 'Neutered|Spayed' THEN 'O' ELSE 'X' END
 * This approach is highly scalable when the number of matching keywords increases.
 */

SELECT 
    ANIMAL_ID, 
    NAME,
    CASE WHEN SEX_UPON_INTAKE LIKE '%Neutered%' THEN 'O'
         WHEN SEX_UPON_INTAKE LIKE '%Spayed%' THEN 'O'
    ELSE 'X'
    END AS '중성화'
FROM ANIMAL_INS
ORDER BY ANIMAL_ID ASC;