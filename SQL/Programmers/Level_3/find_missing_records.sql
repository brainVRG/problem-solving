/*
 * Problem: Find Missing Records (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/59042
 * Concept: LEFT JOIN, IS NULL (Anti-Join pattern), ORDER BY
 *
 * [Approach]
 * 1. Perform a LEFT JOIN starting from the ANIMAL_OUTS (O) table to the ANIMAL_INS (I) table using ANIMAL_ID.
 * 2. This ensures all adoption records are kept, while matching intake records are attached where they exist.
 * 3. Filter the results using WHERE I.ANIMAL_ID IS NULL to isolate the records where an intake history is missing (Anti-Join).
 * 4. Sort the final results by ANIMAL_ID in ascending order.
 */

SELECT O.ANIMAL_ID, O.NAME
FROM ANIMAL_OUTS AS O
LEFT JOIN ANIMAL_INS AS I
ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE I.ANIMAL_ID IS NULL
ORDER BY ANIMAL_ID;