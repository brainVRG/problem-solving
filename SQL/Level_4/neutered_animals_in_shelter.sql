/*
Problem: Neutered Animals in the Shelter (Level 3)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/59045
Concept: INNER JOIN, WHERE, Comparison Operators, ORDER BY

[Approach]
1. INNER JOIN tables on ANIMAL_ID.
2. Filter rows where intake and outcome statuses differ.
3. Sort by ANIMAL_ID.
*/

SELECT I.ANIMAL_ID, I.ANIMAL_TYPE, I.NAME
FROM ANIMAL_INS AS I
INNER JOIN ANIMAL_OUTS AS O
ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE I.SEX_UPON_INTAKE != O.SEX_UPON_OUTCOME
ORDER BY ANIMAL_ID ASC;