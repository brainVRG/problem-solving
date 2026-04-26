/*
 * Problem: Female Members Born in March (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/131120
 * Concept: SELECT, WHERE, DATE_FORMAT, IS NOT NULL, ORDER BY
 *
 * [Approach]
 * 1. Select required columns and format DATE_OF_BIRTH as 'YYYY-MM-DD'.
 * 2. Filter records where TLNO is not null, birth month is March, and gender is 'W' (Female).
 * 3. Sort the final results by MEMBER_ID in ascending order.
 */

SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') AS DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE TLNO IS NOT NULL AND MONTH(DATE_OF_BIRTH) = 3 AND GENDER = 'W'
ORDER BY MEMBER_ID ASC;