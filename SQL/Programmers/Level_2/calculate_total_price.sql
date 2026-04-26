/*
* Problem: Calculate Total Price of Items Matching Condition (Level 2)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/273709
* Concept: Aggregate Function (SUM), Filtering (WHERE)
*
* [Approach]
* 1. FROM: Access the ITEM_INFO table.
* 2. WHERE: Filter records where RARITY is 'LEGEND'.
* 3. SELECT: Calculate the total sum of PRICE using SUM() and assign the alias 'TOTAL_PRICE'.
*/

SELECT SUM(PRICE) AS 'TOTAL_PRICE'
FROM ITEM_INFO
WHERE RARITY = 'LEGEND';