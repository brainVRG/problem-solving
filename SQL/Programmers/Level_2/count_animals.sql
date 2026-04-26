/*
* Problem: Count Animals (Level 2)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/59406
* Concept: Aggregate Function (COUNT)
*
* [Approach]
* 1. FROM: Access the ANIMAL_INS table.
* 2. SELECT: Count the total number of records using COUNT(*) and assign the alias 'count'.
*/

SELECT COUNT(*) AS 'count'
FROM ANIMAL_INS;