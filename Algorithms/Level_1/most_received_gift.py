"""
Problem Name: Most Received Gift (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/258712
Time Complexity: O(G + N^2)
Space Complexity: O(N^2)

[Approach]
1. Map each friend's name to an integer index for 2D array access.
2. Parse the `gifts` array to build 2D matrices (`given` and `taken`) tracking gift exchanges between every pair of friends.
3. Calculate the "present index" for each friend by subtracting their total received gifts from their total given gifts.
4. Iterate through all pairs to calculate the expected gifts for next month based on the exchange history and present index, updating the maximum.

[Retrospective]
The `taken` 2D array is redundant because `taken[i][j]` is always equal to `given[j][i]`, so removing it will save memory and simplify the logic.
"""

def solution(friends, gifts):
    # Index mapping for friends
    mapping = {}
    for i, friend in enumerate(friends):
        mapping[friend] = i
    
    # Declare lists for tracking who given/taken to who and present index
    n_friends = len(friends)
    given = [[0 for _ in range(n_friends)] for _ in range(n_friends)]
    taken = [[0 for _ in range(n_friends)] for _ in range(n_friends)]
    present_index = [0 for _ in range(n_friends)]
    
    # Calculate who given/taken to who
    for gift in gifts:
        from_idx = mapping[gift.split()[0]]
        to_idx = mapping[gift.split()[1]]
        given[from_idx][to_idx] += 1
        taken[to_idx][from_idx] += 1
    
    # Calculate present index values
    for i in range(n_friends):
        present_index[i] = sum(given[i]) - sum(taken[i])
    
    # For iterating all friends, count the present amount
    # Logic 1: If target gave more present to associated, then receive 1 present
    # Logic 2: If target gave same amount or not gave present, then compare present index. If present index is higher, then receive 1 present.
    max_present = 0
    for target in range(n_friends):
        target_present = 0
        for assc in range(n_friends):
            if target==assc:
                continue
            if given[target][assc] > taken[target][assc]:
                target_present += 1
            elif given[target][assc] == taken[target][assc]:
                if present_index[target] > present_index[assc]:
                    target_present += 1
        if target_present > max_present:
            max_present = target_present

    return max_present