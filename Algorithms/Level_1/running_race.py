"""
Problem Name: Running Race (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/178871
Time Complexity: O(N + M)
Space Complexity: O(N)

[Approach]
1. Initialize a hash map (`rank`) to store each player's current index for O(1) lookups.
2. Iterate through `callings` and find the called player's index.
3. Swap the called player with the preceding player in the `players` array and update both indices in the `rank` map.
"""

def solution(players, callings):
    rank = {player: i for i, player in enumerate(players)}
    
    for call in callings:
        player_idx = rank[call]
        rank[call] -= 1
        rank[players[player_idx - 1]] += 1
        players[player_idx], players[player_idx - 1] = players[player_idx - 1], players[player_idx]

    return players

# -- Got Out of Time --
# def solution(players, callings):
#     for call in callings:
#         rank = players.index(call)
#         players[rank], players[rank - 1] = players[rank - 1], players[rank]
#     return players