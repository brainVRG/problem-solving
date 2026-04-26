/*
Problem: Monthly Rental Counts of Frequently Rented Cars (Level 3)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/151139
Concept: Subquery, IN Operator, BETWEEN, GROUP BY, Aggregate Functions (COUNT), HAVING, ORDER BY

[Approach]
1. Use a subquery to identify the CAR_IDs that have been rented 5 or more times in total between '2022-08-01' and '2022-10-31'.
2. In the main query, filter the records to include only those specific CAR_IDs and ensure the START_DATE is also within the same target period.
3. Group the filtered records by the month of START_DATE and CAR_ID.
4. Filter the groups (redundant step, see retrospective) and sort the final results by month in ascending order, then by car ID in descending order.

[Retrospective]
We don't need HAVING COUNT(*) >= 1 because DBMS will automatically not print out row having 0.
*/

SELECT MONTH(START_DATE) AS MONTH, CAR_ID, COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE CAR_ID IN (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY CAR_ID
    HAVING COUNT(*) >= 5)
AND START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY MONTH(START_DATE), CAR_ID
HAVING COUNT(*) >= 1
ORDER BY MONTH ASC, CAR_ID DESC;