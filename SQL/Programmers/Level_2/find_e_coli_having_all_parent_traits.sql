/*
 * Problem: Find E. coli Having All Parent Traits (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/301647
 * Concept: Self INNER JOIN, Bitwise Operators (&), WHERE, ORDER BY
 *
 * [Approach]
 * 1. Perform a self INNER JOIN on the ECOLI_DATA table to link each child (C) with its parent (P) using PARENT_ID and ID.
 * 2. Use the bitwise AND operator (&) in the WHERE clause to check if the child has all the parent's traits (C.GENOTYPE & P.GENOTYPE = P.GENOTYPE).
 * 3. Select the required columns: the child's ID, child's GENOTYPE, and parent's GENOTYPE.
 * 4. Sort the final results by the child's ID in ascending order.
 */

SELECT C.ID AS ID, C.GENOTYPE AS GENOTYPE, P.GENOTYPE AS PARENT_GENOTYPE
FROM ECOLI_DATA AS C
INNER JOIN ECOLI_DATA AS P
ON C.PARENT_ID = P.ID
WHERE C.GENOTYPE & P.GENOTYPE = P.GENOTYPE
ORDER BY C.ID ASC;