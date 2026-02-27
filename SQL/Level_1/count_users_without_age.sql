/*
* Problem Name: Count Users Without Age Information (Programmers Level 1)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/131528
* Key Concept: IS NULL, COUNT()

[Approach]
1. FROM: Access and load the 'USER_INFO' table.
2. WHERE: Filter the dataset to retain only the records where the 'AGE' column is NULL.
3. SELECT: Calculate the total number of the remaining records using 'COUNT(*)' and assign the alias 'USERS' to the result column.
*/

SELECT COUNT(*) AS 'USERS'
FROM USER_INFO
WHERE AGE IS NULL;