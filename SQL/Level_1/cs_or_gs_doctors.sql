/*
* Problem Name: Cs or GS Doctors (Programmers Level 1)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/132203
* Key Concept: IN, DATE_FORMAT, ORDER BY (Multiple conditions)

[Approach]
1. Filter doctors whose MCDP_CD (department code) is either 'CS' or 'GS' using the IN operator.
2. Format the HIRE_YMD to 'YYYY-MM-DD' as explicitly requested using DATE_FORMAT.
3. Sort the results primarily by HIRE_YMD in descending order.
4. If HIRE_YMD is identical, sort secondarily by DR_NAME in ascending order.
*/

SELECT DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') AS 'HIRE_YMD'
FROM DOCTOR
WHERE MCDP_CD IN ('CS', 'GS')
ORDER BY HIRE_YMD DESC, DR_NAME ASC;