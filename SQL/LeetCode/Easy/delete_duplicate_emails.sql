/*
Problem: Delete Duplicate Emails (Easy)
URL: https://leetcode.com/problems/delete-duplicate-emails/
Concept: DELETE, Self Join

[Approach]
1. Use a self join on the Person table to compare rows with the same email.
2. Delete the row (p1) that has a larger id, ensuring only the unique email with the smallest id remains.
*/

DELETE p1
FROM Person p1, Person p2
WHERE p1.email = p2.email AND p1.id > p2.id;