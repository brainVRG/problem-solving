/*
Problem: Rising Temperature (Easy)
URL: https://leetcode.com/problems/rising-temperature/
Concept: INNER JOIN, DATEDIFF

[Approach]
1. Use an INNER JOIN to self-join the Weather table, comparing each date (R) with its previous day (L).
2. Use DATEDIFF to ensure the recordDate of R is exactly one day after the recordDate of L.
3. Filter for rows where the temperature on day R is strictly greater than the temperature on day L.
*/

SELECT 
    R.id
FROM Weather L
INNER JOIN Weather R
    ON DATEDIFF(R.recordDate, L.recordDate) = 1
WHERE R.temperature > L.temperature;