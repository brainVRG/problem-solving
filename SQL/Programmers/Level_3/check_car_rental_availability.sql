/*
 * Problem: Determine Car Rental Availability (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/157340
 * Concept: GROUP BY, Conditional Aggregation (SUM with CASE WHEN), BETWEEN, ORDER BY
 *
 * [Approach]
 * 1. Group the rental history records by CAR_ID.
 * 2. Use conditional aggregation (SUM combined with CASE WHEN) to evaluate if the target date '2022-10-16' falls between the START_DATE and END_DATE.
 * 3. Assign a value of 1 if the date overlaps and 0 otherwise. If the sum per car is greater than 0, it means the car is currently rented ('대여중'), else available ('대여 가능').
 * 4. Sort the final results by CAR_ID in descending order.
 */

SELECT 
    CAR_ID,
    CASE
        WHEN SUM(CASE WHEN '2022-10-16' BETWEEN START_DATE AND END_DATE THEN 1 ELSE 0 END) > 0 THEN '대여중'
        ELSE '대여 가능'
    END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;