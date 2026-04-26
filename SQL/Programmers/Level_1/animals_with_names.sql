/*
* Problem: Animal IDs with Names (Level 1)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/59407
* Concept: IS NOT NULL
*
* [Approach]
* 1. FROM: ANIMAL_INS
* 2. WHERE: Filter records to keep only those where NAME IS NOT NULL.
* 3. SELECT: ANIMAL_ID.
* 4. ORDER BY: ANIMAL_ID ASC.
*/

SELECT ANIMAL_ID
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
ORDER BY ANIMAL_ID ASC;