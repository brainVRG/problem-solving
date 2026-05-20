/*
Problem: Swap Salary (Easy)
URL: https://leetcode.com/problems/swap-sex-of-employees/
Concept: UPDATE, CASE

[Approach]
1. Use an UPDATE statement to modify the Salary table directly.
2. Use a CASE expression to check the current value of the sex column and swap 'f' to 'm' and 'm' to 'f' in a single operation.
*/

UPDATE Salary
SET sex = 
    CASE
        WHEN sex = 'f' THEN 'm'
        WHEN sex = 'm' THEN 'f'
    END;