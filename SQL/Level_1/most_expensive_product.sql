/*
* Problem: Most Expensive Product (Level 1)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/131697
* Concept: Aggregate Function (MAX)
*
* [Approach]
* 1. FROM: PRODUCT
* 2. SELECT: Calculate the highest value in the PRICE column using MAX() and assign the alias 'MAX_PRICE'.
*/

SELECT MAX(PRICE) AS 'MAX_PRICE'
FROM PRODUCT;