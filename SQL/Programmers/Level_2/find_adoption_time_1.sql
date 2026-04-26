/*
 * Problem: Find Adoption Time (1) (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/59412
 * Concept: Date Function (HOUR), GROUP BY, Filtering
 *
 * [Approach]
 * 1. Extract the hour from the DATETIME column using the HOUR() function.
 * 2. Filter the records to include only hours from 9 to 19.
 * 3. Group the filtered data by the extracted hour and count the occurrences.
 * 4. Sort the final output by the hour in ascending order.
 */

SELECT HOUR(DATETIME) AS 'HOUR', COUNT(*) AS 'COUNT'
FROM ANIMAL_OUTS
WHERE HOUR(DATETIME) <= 19 AND HOUR(DATETIME) >= 9
GROUP BY HOUR(DATETIME)
ORDER BY HOUR(DATETIME) ASC;