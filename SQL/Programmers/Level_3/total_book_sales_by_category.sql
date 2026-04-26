/*
 * Problem: Total Book Sales by Category (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/144855
 * Concept: INNER JOIN, WHERE, BETWEEN, GROUP BY, Aggregate Functions (SUM), ORDER BY
 *
 * [Approach]
 * 1. Perform an INNER JOIN between the BOOK (B) and BOOK_SALES (S) tables using their common key, BOOK_ID.
 * 2. Filter the sales records using the BETWEEN operator to only include dates in January 2022.
 * 3. Group the filtered records by CATEGORY.
 * 4. Calculate the total sales for each category using the SUM(SALES) function.
 * 5. Sort the final results by CATEGORY in ascending order.
 */

SELECT B.CATEGORY CATEGORY, SUM(SALES) TOTAL_SALES
FROM BOOK B
INNER JOIN BOOK_SALES S
ON B.BOOK_ID = S.BOOK_ID
WHERE S.SALES_DATE BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY B.CATEGORY
ORDER BY B.CATEGORY ASC;