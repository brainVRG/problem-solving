/*
Problem: Find Items That Cannot Be Upgraded (Level 3)
URL: https://school.programmers.co.kr/learn/courses/30/lessons/273712
Concept: Subquery, NOT IN Operator, IS NOT NULL, ORDER BY

[Approach]
1. Use a subquery to find all unique PARENT_ITEM_IDs from the ITEM_TREE table.
2. Exclude NULL values in the subquery to ensure the NOT IN operator works correctly and doesn't return an empty set.
3. Filter the ITEM_INFO table to only include items whose ITEM_ID does not appear in the subquery result (meaning they are leaf nodes and cannot be upgraded further).
4. Sort the final results by ITEM_ID in descending order.
*/

SELECT ITEM_ID, ITEM_NAME, RARITY
FROM ITEM_INFO
WHERE ITEM_ID NOT IN (
    SELECT DISTINCT PARENT_ITEM_ID
    FROM ITEM_TREE
    WHERE PARENT_ITEM_ID IS NOT NULL)
ORDER BY ITEM_ID DESC;