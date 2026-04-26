/*
Problem: Total Sales by Author and Category (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/144856
Concept: Multi-JOIN, SARGable Date Filtering, GROUP BY (Multiple Columns)

[Approach]
1. JOIN BOOK, BOOK_SALES, and AUTHOR tables.
2. Filter for January 2022 using range operators.
3. Group by author and category to calculate total sales (SUM(SALES * PRICE)).
4. Order by AUTHOR_ID (ASC) and CATEGORY (DESC).
*/

SELECT 
    A.AUTHOR_ID, 
    A.AUTHOR_NAME,
    B.CATEGORY,
    SUM(S.SALES * B.PRICE) AS TOTAL_SALES
FROM BOOK AS B
INNER JOIN BOOK_SALES AS S
ON B.BOOK_ID = S.BOOK_ID
INNER JOIN AUTHOR AS A
ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE 
    S.SALES_DATE >= '2022-01-01'
    AND S.SALES_DATE < '2022-02-01'
GROUP BY A.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY
ORDER BY A.AUTHOR_ID ASC, B.CATEGORY DESC;