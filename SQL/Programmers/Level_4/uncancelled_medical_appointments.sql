/*
Problem: Uncancelled Medical Appointments (Level 4)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/132204
Concept: Multi-JOIN, SARGable Date Filtering, ORDER BY

[Approach]
1. JOIN PATIENT, APPOINTMENT, and DOCTOR tables using respective IDs.
2. Filter conditions: 'CS' department, uncancelled ('N'), and date exactly on '2022-04-13'.
3. Order the results by APNT_YMD in ascending order.
*/

SELECT 
    A.APNT_NO, 
    P.PT_NAME, 
    P.PT_NO,
    D.MCDP_CD, 
    D.DR_NAME, 
    A.APNT_YMD
FROM PATIENT AS P
INNER JOIN APPOINTMENT AS A
ON P.PT_NO = A.PT_NO
INNER JOIN DOCTOR AS D
ON A.MDDR_ID = D.DR_ID
WHERE 
    D.MCDP_CD = 'CS' 
    AND A.APNT_YMD >= '2022-04-13' 
    AND A.APNT_YMD < '2022-04-14' 
    AND A.APNT_CNCL_YN = 'N'
ORDER BY A.APNT_YMD ASC;