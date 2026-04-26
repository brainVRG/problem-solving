/*
Problem: Combine Two Tables (Easy)
URL: https://leetcode.com/problems/combine-two-tables/
Concept: LEFT JOIN

[Approach]
1. Use a LEFT JOIN from the Person table to the Address table using personId.
2. Select firstName, lastName, city, and state explicitly using table aliases.
*/

SELECT 
    P.firstName, 
    P.lastName, 
    A.city, 
    A.state
FROM Person AS P
LEFT JOIN Address AS A
    ON P.personId = A.personId;