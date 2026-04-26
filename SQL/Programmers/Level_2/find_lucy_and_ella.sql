/*
 * Problem: Find Lucy and Ella (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/59046
 * Concept: SELECT, WHERE, IN Operator, ORDER BY
 *
 * [Approach]
 * 1. Select the required columns: ANIMAL_ID, NAME, and SEX_UPON_INTAKE.
 * 2. Filter the records to include only animals whose NAME matches any in the given list ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty') using the IN operator.
 * 3. Sort the final results by ANIMAL_ID in ascending order.
 */

SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
ORDER BY ANIMAL_ID ASC;