/*
 * Problem: Find Upgraded Item (Level 2)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/273711
 * Concept: Subquery, IN Operator, INNER JOIN, ORDER BY
 *
 * [Approach]
 * 1. Use a subquery to identify the ITEM_ID of all items that have a 'RARE' rarity.
 * 2. In the main query, perform an INNER JOIN between ITEM_INFO (I) and ITEM_TREE (T) to access both item details and their parent-child relationships.
 * 3. Filter the joined records using the WHERE clause and the IN operator, keeping only items whose PARENT_ITEM_ID matches the list of 'RARE' item IDs.
 * 4. Sort the final results by ITEM_ID in descending order.
 *
 * [Retrospective]
 * Optimization tip: The subquery doesn't require a JOIN. A simpler `(SELECT ITEM_ID FROM ITEM_INFO WHERE RARITY = 'RARE')` is sufficient and improves execution performance.
 */

SELECT I.ITEM_ID, I.ITEM_NAME, I.RARITY
FROM ITEM_INFO AS I
INNER JOIN ITEM_TREE AS T
ON I.ITEM_ID = T.ITEM_ID
WHERE T.PARENT_ITEM_ID IN (SELECT I.ITEM_ID
    FROM ITEM_INFO AS I
    INNER JOIN ITEM_TREE AS T
    ON I.ITEM_ID = T.ITEM_ID
    WHERE RARITY = 'RARE')
ORDER BY I.ITEM_ID DESC;