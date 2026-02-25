/*
* Problem: List Food Warehouses in Gyeonggi-do (Level 1)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/131114
* Concept: LIKE, IFNULL
*
* [Approach]
* 1. FROM: FOOD_WAREHOUSE
* 2. WHERE: Filter records where ADDRESS starts with '경기도' using LIKE.
* 3. SELECT: Choose required columns, replacing NULL in FREEZER_YN with 'N' using IFNULL.
* 4. ORDER BY: WAREHOUSE_ID ASC.
*/

SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, IFNULL(FREEZER_YN,'N') AS 'FREEZER_YN'
FROM FOOD_WAREHOUSE
WHERE ADDRESS LIKE '경기도%'
ORDER BY WAREHOUSE_ID ASC;