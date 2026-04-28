/*
Problem: Duplicate Emails (Easy)
URL: https://leetcode.com/problems/duplicate-emails/
Concept: Subquery, GROUP BY, HAVING

[Approach]
1. Use a subquery with GROUP BY and HAVING to identify emails that appear 2 or more times.
2. Filter the main Person table to select DISTINCT emails that exist in the subquery result.
*/

SELECT DISTINCT email AS Email
FROM Person
WHERE email IN
    (SELECT email
    FROM Person
    GROUP BY email
    HAVING COUNT(email) >= 2);