/*
 * Problem: Find User Information that Matches the Condition (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/164670
 * Concept: INNER JOIN, String Functions (CONCAT, LEFT, SUBSTRING, RIGHT), GROUP BY, HAVING, ORDER BY
 *
 * [Approach]
 * 1. Perform an INNER JOIN between USED_GOODS_BOARD (B) and USED_GOODS_USER (U) using the writer/user ID.
 * 2. Format the full address by concatenating the city, street address 1, and street address 2 with spaces.
 * 3. Format the telephone number by extracting and concatenating parts of the string with hyphens ('-').
 * 4. Group the results by all selected user columns to satisfy standard SQL grouping rules.
 * 5. Filter the groups using the HAVING clause to include only users who have posted 3 or more items.
 * 6. Sort the final results by USER_ID in descending order.
 */

SELECT 
    U.USER_ID, 
    U.NICKNAME, 
    CONCAT(U.CITY, ' ', U.STREET_ADDRESS1, ' ', U.STREET_ADDRESS2) AS '전체주소', 
    CONCAT(LEFT(TLNO, 3), '-', SUBSTRING(TLNO, 4, 4), '-', RIGHT(TLNO, 4)) AS '전화번호'
FROM USED_GOODS_BOARD AS B
INNER JOIN USED_GOODS_USER AS U
ON B.WRITER_ID = U.USER_ID
GROUP BY 
    U.USER_ID, 
    U.NICKNAME, 
    U.CITY,
    U.STREET_ADDRESS1,
    U.STREET_ADDRESS2,
    U.TLNO
HAVING COUNT(B.BOARD_ID) >= 3
ORDER BY U.USER_ID DESC;