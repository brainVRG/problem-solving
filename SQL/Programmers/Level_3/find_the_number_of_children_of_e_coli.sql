/*
Problem: Find the Number of Children of E. coli (Level 3)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/299305
Concept: Self LEFT JOIN, GROUP BY, Aggregate Functions (COUNT)

[Approach]
1. Perform a self LEFT JOIN on the ECOLI_DATA table to match each parent (L) with their potential children (R) using L.ID = R.PARENT_ID.
2. Group the results by the parent's ID (L.ID).
3. Count the number of child IDs (R.ID) to determine the child count. Using COUNT(R.ID) correctly evaluates to 0 when there are no children (since R.ID would be NULL).
*/

SELECT L.ID, COUNT(R.ID) CHILD_COUNT
FROM ECOLI_DATA L
LEFT JOIN ECOLI_DATA R
ON L.ID = R.PARENT_ID
GROUP BY L.ID
ORDER BY L.ID ASC;