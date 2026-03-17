/*
 * Problem: Find a List of Cars with Rental Records (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/157341
 * Concept: SELECT DISTINCT, INNER JOIN, WHERE, Date Functions (MONTH), ORDER BY
 *
 * [Approach]
 * 1. Perform an INNER JOIN between the CAR_RENTAL_COMPANY_CAR (C) and CAR_RENTAL_COMPANY_RENTAL_HISTORY (H) tables using their common key, CAR_ID.
 * 2. Filter the records using the WHERE clause to include only '세단' (Sedan) cars and rentals that started in October (MONTH(START_DATE) = 10).
 * 3. Use the DISTINCT keyword to ensure each car ID is listed only once, even if it had multiple rental records in that month.
 * 4. Sort the final distinct car IDs in descending order.
 */

SELECT DISTINCT C.CAR_ID AS CAR_ID
FROM CAR_RENTAL_COMPANY_CAR AS C
INNER JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS H
ON C.CAR_ID = H.CAR_ID
WHERE MONTH(H.START_DATE) = 10 AND C.CAR_TYPE = '세단'
ORDER BY C.CAR_ID DESC;