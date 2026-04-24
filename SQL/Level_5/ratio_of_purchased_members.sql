/*
Problem: Ratio of Purchased Members (Level 5)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/131534
Concept: CTE, Scalar Subquery, COUNT DISTINCT, Date Range

[Approach]
1. Create a CTE (ID_JOIN_2021) to isolate users who joined in 2021.
2. Filter the ONLINE_SALE table to include only users present in the CTE.
3. Group the sales records by YEAR and MONTH.
4. Calculate the ratio by dividing the count of distinct purchasing users by the total user count from the CTE, rounded to one decimal place.

[Retrospective]
Using `JOINED <= '2021-12-31'` is risky if the column contains time components (e.g., '2021-12-31 14:00:00' would be excluded). The standard, fail-safe SARGable approach is `JOINED >= '2021-01-01' AND JOINED < '2022-01-01'`.
*/

WITH ID_JOIN_2021 AS (
    SELECT USER_ID AS ID
    FROM USER_INFO
    WHERE JOINED >= '2021-01-01' AND JOINED <= '2021-12-31'
)

SELECT 
    YEAR(SALES_DATE) AS YEAR,
    MONTH(SALES_DATE) AS MONTH,
    COUNT(DISTINCT USER_ID) AS PURCHASED_USERS,
    ROUND(COUNT(DISTINCT USER_ID) / (SELECT COUNT(ID) FROM ID_JOIN_2021), 1) AS PURCHASED_RATIO
FROM ONLINE_SALE
WHERE 
    USER_ID IN (SELECT ID FROM ID_JOIN_2021)
GROUP BY 
    YEAR(SALES_DATE),
    MONTH(SALES_DATE)
ORDER BY 
    YEAR ASC,
    MONTH ASC;