/*
 * Problem: Find Used Goods Transaction Status that Matches the Condition (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/164672
 * Concept: SELECT, CASE WHEN, WHERE, ORDER BY
 *
 * [Approach]
 * 1. Select the required columns from the USED_GOODS_BOARD table.
 * 2. Use a CASE statement to map the raw STATUS codes ('SALE', 'RESERVED', 'DONE') to their corresponding Korean labels ('판매중', '예약중', '거래완료').
 * 3. Filter the records using the WHERE clause to only include transactions created on the specific date '2022-10-05'.
 * 4. Sort the final results by BOARD_ID in descending order.
 */

SELECT 
    BOARD_ID, WRITER_ID, TITLE, PRICE,
    CASE
        WHEN STATUS = 'SALE' THEN '판매중'
        WHEN STATUS = 'RESERVED' THEN '예약중'
        WHEN STATUS = 'DONE' THEN '거래완료'
    END AS STATUS
FROM USED_GOODS_BOARD
WHERE CREATED_DATE = '2022-10-05'
ORDER BY BOARD_ID DESC;