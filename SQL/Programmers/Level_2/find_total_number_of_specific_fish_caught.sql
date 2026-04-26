/*
 * Problem: Find the Total Number of Specific Fish Caught (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/298518
 * Concept: INNER JOIN, WHERE, IN Operator, Aggregate Functions (COUNT)
 *
 * [Approach]
 * 1. Perform an INNER JOIN between the FISH_INFO (I) and FISH_NAME_INFO (N) tables using their common key, FISH_TYPE.
 * 2. Filter the joined records using the WHERE clause and the IN operator to include only those where the FISH_NAME is either 'BASS' or 'SNAPPER'.
 * 3. Count the total number of the filtered records using COUNT(*) to get the final catch count.
 */

SELECT COUNT(*) AS FISH_COUNT
FROM FISH_INFO AS I
INNER JOIN FISH_NAME_INFO AS N
ON I.FISH_TYPE = N.FISH_TYPE
WHERE FISH_NAME IN ('BASS', 'SNAPPER');