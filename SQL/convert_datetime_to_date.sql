/*
 * Problem: Convert DATETIME to DATE (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/59414
 * Concept: Date and Time Functions (DATE_FORMAT)
 *
 * [Approach]
 * Use DATE_FORMAT() with the '%Y-%m-%d' specifier to extract only the date portion
 * (Year-Month-Day) from the DATETIME column.
 * Sort the final result by ANIMAL_ID in ascending order.
 */

SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME, '%Y-%m-%d') AS 날짜
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;