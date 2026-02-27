/*
 * Problem: Handle NULLs (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/59410
 * Concept: NULL Handling (IFNULL)
 *
 * [Approach]
 * Use IFNULL() to check the NAME column. If it is NULL, replace it with 'No name'.
 * Select the required columns and sort the result by ANIMAL_ID in ascending order.
 */

SELECT ANIMAL_TYPE, IFNULL(NAME, 'No name') AS 'NAME', SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;