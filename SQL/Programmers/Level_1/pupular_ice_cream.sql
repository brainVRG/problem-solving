/*
* Problem Name: Poplular Ice Cream (Programmers Level 1)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/133024
* Key Concepts: ORDERBY 

[Approach]
1. SELECT the FLAVOR column
2. Sort the records primarily by TOTAL_ORDER in descending order.
3. If TOTAL_ORDER is the same, sort secondarily by SHIPMENT_ID in ascending order.
*/

SELECT FLAVOR
FROM FIRST_HALF
ORDER BY TOTAL_ORDER DESC, SHIPMENT_ID ASC;