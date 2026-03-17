/*
 * Problem: Find Users and Total Transaction Amount (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/164668
 * Concept: INNER JOIN, WHERE, GROUP BY, Aggregate Functions (SUM), HAVING, ORDER BY
 *
 * [Approach]
 * 1. Perform an INNER JOIN between USED_GOODS_BOARD (B) and USED_GOODS_USER (U) on their common key (WRITER_ID = USER_ID).
 * 2. Filter the records using the WHERE clause to include only transactions with a 'DONE' status.
 * 3. Group the filtered records by the user's ID (U.USER_ID).
 * 4. Calculate the total transaction amount using SUM(PRICE) and filter groups using the HAVING clause for totals >= 700,000.
 * 5. Sort the final results by the total transaction amount in ascending order.
 */

SELECT U.USER_ID AS USER_ID, U.NICKNAME AS NICKNAME, SUM(PRICE) AS TOTAL_SALES
FROM USED_GOODS_BOARD AS B
INNER JOIN USED_GOODS_USER AS U
ON B.WRITER_ID = U.USER_ID
WHERE B.STATUS = 'DONE'
GROUP BY U.USER_ID
HAVING SUM(PRICE) >= 700000
ORDER BY SUM(PRICE) ASC;