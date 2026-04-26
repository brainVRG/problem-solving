/*
 * Problem: Average Distance Between Stations by Route (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/284531
 * Concept: SELECT, GROUP BY, Aggregate Functions (SUM, AVG), ROUND, CONCAT, ORDER BY
 *
 * [Approach]
 * 1. Group the subway station records by ROUTE.
 * 2. Calculate the total cumulative distance for each route using SUM() on D_BETWEEN_DIST, round to 1 decimal place, and append 'km' using CONCAT().
 * 3. Calculate the average distance between stations using AVG() on D_BETWEEN_DIST, round to 2 decimal places, and append 'km' using CONCAT().
 * 4. Sort the final results by the raw numeric sum of D_BETWEEN_DIST in descending order to prevent incorrect string-based sorting.
 */

SELECT 
    ROUTE, 
    CONCAT(ROUND(SUM(D_BETWEEN_DIST), 1), 'km') TOTAL_DISTANCE,
    CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2), 'km') AVERAGE_DISTANCE 
FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY SUM(D_BETWEEN_DIST) DESC;