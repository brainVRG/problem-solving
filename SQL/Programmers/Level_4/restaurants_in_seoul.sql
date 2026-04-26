/*
Problem: List Restaurants Located in Seoul (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/131118
Concept: JOIN, String Function / LIKE, GROUP BY, Aggregate Function (AVG, ROUND)

[Approach]
1. JOIN REST_INFO and REST_REVIEW tables on REST_ID.
2. Filter the records where the ADDRESS starts with '서울'.
3. Group by restaurant details to calculate the average review score, rounded to the second decimal place.
4. Order the result by the calculated average score in descending order, then by FAVORITES in descending order.

[Retrospective]
Using `LEFT(I.ADDRESS, 2) = '서울'` is non-SARGable and causes index suppression, leading to a full table scan. For better performance in production environments, it is strongly recommended to use `I.ADDRESS LIKE '서울%'` to allow the DBMS to utilize index range scans.
*/

SELECT 
    I.REST_ID, 
    I.REST_NAME, 
    I.FOOD_TYPE, 
    I.FAVORITES, 
    I.ADDRESS, 
    ROUND(AVG(R.REVIEW_SCORE), 2) AS SCORE
FROM REST_INFO AS I
INNER JOIN REST_REVIEW AS R
ON I.REST_ID = R.REST_ID
WHERE LEFT(I.ADDRESS, 2) = '서울'
GROUP BY 
    I.REST_ID, 
    I.REST_NAME, 
    I.FOOD_TYPE, 
    I.FAVORITES, 
    I.ADDRESS
ORDER BY SCORE DESC, I.FAVORITES DESC;