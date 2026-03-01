/*
 * Problem: Count Appointments by Medical Department (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/132202
 * Concept: GROUP BY, Aggregate Function, SARGable Date Filtering
 *
 * [Approach]
 * 1. Filter records specifically for May 2022 using an index-friendly (SARGable) range condition on APNT_YMD.
 * 2. Group the data by department code (MCDP_CD) and count the appointments.
 * 3. Sort by the appointment count (ascending) and then by department code (ascending).
 */

SELECT MCDP_CD AS '진료과코드', COUNT(*) AS '5월예약건수'
FROM APPOINTMENT
WHERE APNT_YMD >= '2022-05-01' AND APNT_YMD < '2022-06-01'
GROUP BY MCDP_CD
ORDER BY COUNT(*) ASC, MCDP_CD ASC;