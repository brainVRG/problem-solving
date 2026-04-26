/*
 * Problem: Long Term Protected Animals (2) (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/59411
 * Concept: INNER JOIN, Date Functions (DATEDIFF), ORDER BY, LIMIT
 *
 * [Approach]
 * 1. Perform an INNER JOIN between ANIMAL_INS (I) and ANIMAL_OUTS (O) using ANIMAL_ID to find animals that have been adopted.
 * 2. Calculate the protection duration using DATEDIFF(O.DATETIME, I.DATETIME) in the ORDER BY clause.
 * 3. Sort the results by this calculated duration in descending order to place the longest protected animals first.
 * 4. Use LIMIT 2 to retrieve only the top two records.
 *
 * [Retrospective]
 * Tip: While DATEDIFF calculates the difference in days, using `TIMESTAMPDIFF(SECOND, I.DATETIME, O.DATETIME)` provides exact precision down to the second when dealing with DATETIME types.
 */

SELECT I.ANIMAL_ID, I.NAME
FROM ANIMAL_INS AS I
INNER JOIN ANIMAL_OUTS AS O
ON I.ANIMAL_ID = O.ANIMAL_ID
ORDER BY DATEDIFF(O.DATETIME, I.DATETIME) DESC
LIMIT 2;