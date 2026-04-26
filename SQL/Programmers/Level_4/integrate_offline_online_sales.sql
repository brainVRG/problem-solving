/*
Problem: Integrate Offline and Online Sales Data (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/131537
Concept: UNION ALL, Inline View, SARGable Date Filtering, Date Formatting

[Approach]
1. Use an inline view 't' to combine ONLINE_SALE and OFFLINE_SALE data using UNION ALL.
2. Filter both tables for March 2022 using range operators (>=, <).
3. Assign NULL to USER_ID in the OFFLINE_SALE select statement to match the column count and types of ONLINE_SALE.
4. Format the date and order the final result by date, product ID, and user ID.
*/

SELECT 
    DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE, 
    PRODUCT_ID, 
    USER_ID, 
    SALES_AMOUNT
FROM
    (
    SELECT ONL.SALES_DATE, ONL.PRODUCT_ID, ONL.USER_ID, ONL.SALES_AMOUNT
    FROM ONLINE_SALE AS ONL
    WHERE ONL.SALES_DATE >= '2022-03-01' AND ONL.SALES_DATE < '2022-04-01'
    UNION ALL
    SELECT OFF.SALES_DATE, OFF.PRODUCT_ID, NULL AS USER_ID, OFF.SALES_AMOUNT
    FROM OFFLINE_SALE AS OFF
    WHERE OFF.SALES_DATE >= '2022-03-01' AND OFF.SALES_DATE < '2022-04-01'
    ) t
ORDER BY 
    SALES_DATE ASC,
    PRODUCT_ID ASC,
    USER_ID ASC;