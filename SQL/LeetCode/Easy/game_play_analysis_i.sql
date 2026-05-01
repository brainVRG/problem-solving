/*
Problem: Game Play Analysis I (Easy)
URL: https://leetcode.com/problems/game-play-analysis-i/
Concept: GROUP BY, Aggregate Function

[Approach]
1. Group the Activity table by player_id.
2. Use the MIN() aggregate function on the event_date column to find the earliest login date for each player.
*/

SELECT 
    player_id, 
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;