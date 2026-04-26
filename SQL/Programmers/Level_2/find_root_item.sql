/*
 * Problem: Find Root Item (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/273710
 * Concept: LEFT JOIN, WHERE, IS NULL, ORDER BY
 *
 * [Approach]
 * 1. Perform a LEFT JOIN between the ITEM_TREE (T) and ITEM_INFO (I) tables using their common key, ITEM_ID.
 * 2. Filter the records using 'WHERE T.PARENT_ITEM_ID IS NULL' to identify only the root items (items without a parent).
 * 3. Select the required columns: ITEM_ID and ITEM_NAME.
 * 4. Sort the final results by ITEM_ID in ascending order.
 */

SELECT T.ITEM_ID, I.ITEM_NAME
FROM ITEM_TREE AS T
LEFT JOIN ITEM_INFO AS I
ON T.ITEM_ID = I.ITEM_ID
WHERE T.PARENT_ITEM_ID IS NULL
ORDER BY T.ITEM_ID ASC;