/*
 * Problem: Places Owned by Heavy Users (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/77487
 * Concept: Subquery, IN Operator, GROUP BY, Aggregate Functions (COUNT), HAVING, ORDER BY
 *
 * [Approach]
 * 1. Use a subquery to identify "heavy users" by grouping the PLACES table by HOST_ID.
 * 2. Apply the HAVING clause with COUNT(*) >= 2 to filter only those HOST_IDs that have registered two or more places.
 * 3. In the main query, select the details from the PLACES table where the HOST_ID exists in the results of the subquery using the IN operator.
 * 4. Sort the final results by the place ID in ascending order.
 */

SELECT ID, NAME, HOST_ID
FROM PLACES
WHERE HOST_ID IN (
    SELECT HOST_ID
    FROM PLACES
    GROUP BY HOST_ID
    HAVING COUNT(*) >= 2)
ORDER BY ID ASC;