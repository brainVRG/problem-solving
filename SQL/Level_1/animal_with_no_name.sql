/*
* Problem Name: Animal Name with No Name (Programmers Level 1)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/59039
* Key Concept: IS NULL, ORDER BY

[Approach]
1. Filter the records where the NAME column is NULL using the 'IS NULL' operator.
2. Select the ANIMAL_ID column.
3. Sort the result by ANIMAL_ID in ascending order as explicitly requested.
*/

SELECT ANIMAL_ID
FROM ANIMAL_INS
WHERE NAME IS NULL
ORDER BY ANIMAL_ID ASC;