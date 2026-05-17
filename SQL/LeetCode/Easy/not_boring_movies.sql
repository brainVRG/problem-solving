/*
Problem: Not Boring Movies (Easy)
URL: https://leetcode.com/problems/not-boring-movies/
Concept: Modulo Operator, WHERE Clause, ORDER BY

[Approach]
1. Use the modulo operator (id % 2 = 1) to filter for odd-numbered IDs.
2. Add a condition to exclude movies where the description is 'boring'.
3. Order the final result set by rating in descending order.
*/

SELECT *
FROM Cinema
WHERE id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC;