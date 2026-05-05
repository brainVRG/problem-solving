/*
Problem: Big Countries (Easy)
URL: https://leetcode.com/problems/big-countries/
Concept: WHERE clause, OR operator

[Approach]
1. Select the name, population, and area columns from the World table.
2. Use the WHERE clause with the OR operator to filter for countries that have an area >= 3,000,000 or a population >= 25,000,000.
*/

SELECT 
    name,
    population,
    area
FROM World
WHERE population >= 25000000 OR area >= 3000000;