/*
* Problem: Print Factories Located In Gangwon-do (Level 1)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/131112
* Concept: SUBSTRING / LIKE
*
* [Approach]
* 1. FROM: FOOD_FACTORY
* 2. WHERE: Filter records where ADDRESS starts with '강원도'.
* 3. SELECT: FACTORY_ID, FACTORY_NAME, ADDRESS.
* 4. ORDER BY: FACTORY_ID ASC.
*/

SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
WHERE SUBSTRING(ADDRESS, 1, 3) = '강원도'
ORDER BY FACTORY_ID ASC;