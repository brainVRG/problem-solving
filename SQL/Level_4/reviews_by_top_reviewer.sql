/*
Problem: Output Restaurant List that Meets Group Conditions (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/131124
Concept: JOIN, Window Function (RANK), GROUP BY, Date Formatting

[Approach]
1. Use an inline view 't' to calculate the rank of members based on their total review count in descending order.
2. Join MEMBER_PROFILE, REST_REVIEW, and the inline view 't' using MEMBER_ID.
3. Filter the records where REVIEW_COUNT_RANK is 1.
4. Format REVIEW_DATE to '%Y-%m-%d' and order by date (ASC) and text (ASC).

[Retrospective]
Using a `LEFT JOIN` followed by a `WHERE` filtering condition on the right table (`t.REVIEW_COUNT_RANK = 1`) implicitly converts the operation into an `INNER JOIN`. Explicitly declaring `INNER JOIN` is the standard practice for query clarity and optimizer predictability.
*/

SELECT 
    M.MEMBER_NAME,
    R.REVIEW_TEXT,
    DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM MEMBER_PROFILE AS M
INNER JOIN REST_REVIEW AS R 
    ON M.MEMBER_ID = R.MEMBER_ID
INNER JOIN 
    (
    SELECT 
        MEMBER_ID,
        RANK() OVER(ORDER BY COUNT(*) DESC) AS REVIEW_COUNT_RANK
    FROM REST_REVIEW
    GROUP BY MEMBER_ID
    ) t
    ON M.MEMBER_ID = t.MEMBER_ID
WHERE t.REVIEW_COUNT_RANK = 1
ORDER BY R.REVIEW_DATE ASC, R.REVIEW_TEXT ASC;