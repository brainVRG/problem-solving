/*
* Problem Name: Female Patients Under 12 (Programmers Level 1)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/132201
* Key Concepts: IFNULL, Multiple WHERE conditions, ORDER BY 

[Approach]
1. SELECT the required columns.
2. Use IFNULL func. to replace NULL values in the TLNO(phone number) with 'None'.
3. Filter the records where AGE is 12 or under, AND GEND_CD is 'W' (Female).
4. Sort the results primarily by AGE in desc. order.
5. If AGE is the same, sort secondarily by PT_NAME in asc. order.
*/

SELECT PT_NAME, PT_NO, GEND_CD, AGE, IFNULL(TLNO, 'NONE') AS 'TLNO'
FROM PATIENT
WHERE AGE <= 12 AND GEND_CD = 'W'
ORDER BY AGE DESC, PT_NAME ASC;