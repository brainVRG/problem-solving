/*
Problem: Actors and Directors Who Cooperated At Least Three Times (Easy)
URL: https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
Concept: GROUP BY, HAVING

[Approach]
1. Group the ActorDirector table by both actor_id and director_id to identify unique pairs of cooperation.
2. Use the HAVING clause with COUNT(*) >= 3 to filter and return only the pairs that have worked together at least three times.
*/

SELECT 
    actor_id, 
    director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;