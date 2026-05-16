/*
Problem: Biggest Single Number (Easy)
URL: https://leetcode.com/problems/biggest-single-number/
Concept: Subquery, GROUP BY, HAVING, Aggregate Function

[Approach]
1. Use a subquery to group the numbers and filter them with HAVING COUNT(*) = 1 to find all single numbers.
2. Use the MAX() function in the outer query to select the largest number from the subquery result. If no single numbers exist, MAX() will automatically return NULL.
*/

SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS SingleNumbers;