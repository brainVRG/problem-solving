/*
Problem: Triangle Judgement (Easy)
URL: https://leetcode.com/problems/triangle-judgement/
Concept: CASE, Control Flow

[Approach]
1. Use a CASE statement to verify the Triangle Inequality Theorem.
2. A valid triangle is formed if and only if the sum of any two sides is strictly greater than the third side (x + y > z AND x + z > y AND y + z > x).
*/

SELECT 
    x, 
    y, 
    z,
    CASE 
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;