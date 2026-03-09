/*
 * Problem: Calculate Average Car Rental Duration (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/157342
 * Concept: GROUP BY, Date Functions (DATEDIFF), Aggregate Functions (AVG), ROUND, HAVING, ORDER BY
 *
 * [Approach]
 * 1. Calculate the duration for each rental record using DATEDIFF(END_DATE, START_DATE) and adding 1 to include both the start and end days.
 * 2. Group the rental records by CAR_ID.
 * 3. Calculate the average rental duration for each car and round it to the first decimal place using the ROUND() and AVG() functions.
 * 4. Filter the grouped results using the HAVING clause to include only those cars with an average duration of 7 days or more.
 * 5. Sort the final results by AVERAGE_DURATION in descending order, and then by CAR_ID in descending order.
 */

SELECT CAR_ID, ROUND(AVG(DATEDIFF(END_DATE, START_DATE) + 1), 1) AS AVERAGE_DURATION
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
HAVING AVERAGE_DURATION >= 7
ORDER BY AVERAGE_DURATION DESC, CAR_ID DESC;