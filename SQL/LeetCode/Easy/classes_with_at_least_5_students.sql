/*
Problem: Classes With at Least 5 Students (Easy)
URL: https://leetcode.com/problems/classes-with-at-least-5-students/
Concept: GROUP BY, HAVING

[Approach]
1. Group the Courses table by the class column.
2. Use the HAVING clause with the COUNT() function to filter for classes that have at least 5 students.
*/

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;