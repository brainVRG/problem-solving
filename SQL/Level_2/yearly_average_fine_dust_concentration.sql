/*
 * Problem: Yearly Average Fine Dust Concentration (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/284530
 * Concept: SELECT, WHERE, GROUP BY, Aggregate Functions (AVG), ROUND, YEAR, ORDER BY
 *
 * [Approach]
 * 1. Extract the year from the YM column using the YEAR() function.
 * 2. Filter the records to include only '경기도' for LOCATION1 and '수원' for LOCATION2.
 * 3. Group the filtered results by the extracted year.
 * 4. Calculate the average of PM_VAL1 (PM10) and PM_VAL2 (PM2.5) for each year, rounding to 2 decimal places.
 * 5. Sort the final results by year in ascending order.
 */

SELECT YEAR(YM) AS 'YEAR', ROUND(AVG(PM_VAL1),2) AS 'PM10', ROUND(AVG(PM_VAL2),2) AS 'PM2.5'
FROM AIR_POLLUTION
WHERE LOCATION1='경기도' AND LOCATION2 = '수원'
GROUP BY YEAR(YM)
ORDER BY YEAR;