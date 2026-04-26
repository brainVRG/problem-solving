/*
 * Problem: Find Animals with 'el' in Their Names (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/59047
 * Concept: String Pattern Matching (LIKE), Filtering, Sorting
 *
 * [Approach]
 * 1. Filter condition 1: The animal must be a 'DOG'.
 * 2. Filter condition 2: The name must contain 'el' (case-insensitive, handled by LOWER()).
 * 3. Sort the final results by NAME in ascending order.
 */

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE LOWER(NAME) LIKE '%el%' AND ANIMAL_TYPE = 'DOG'
ORDER BY NAME ASC;