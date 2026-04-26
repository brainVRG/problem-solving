/*
 * Problem: Find the Restaurant with the Most Favorites by Food Type (Level 3)
 * URL: https://school.programmers.co.kr/learn/courses/30/lessons/131123
 * Concept: Subquery, IN Operator (Multi-column), GROUP BY, Aggregate Functions (MAX), ORDER BY
 *
 * [Approach]
 * 1. Use a subquery to find the maximum number of favorites (MAX(FAVORITES)) for each food type (GROUP BY FOOD_TYPE).
 * 2. In the main query, filter the REST_INFO table using a multi-column IN operator.
 * 3. Select the rows where the combination of (FOOD_TYPE, FAVORITES) exactly matches the results from the subquery.
 * 4. Sort the final results by FOOD_TYPE in descending order.
 *
 */

SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN (
    SELECT FOOD_TYPE, MAX(FAVORITES)
    FROM REST_INFO
    GROUP BY FOOD_TYPE
)
ORDER BY FOOD_TYPE DESC;