"""
Problem Name: Failure Rate (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/42889
Time Complexity: O(M + N log N) where M is the length of 'stages'
Space Complexity: O(N)

[Approach]
1. Create a frequency array 'fails' to count the number of players stuck at each stage. The size is N+1 to accommodate players who cleared all stages.
2. Iterate through the 'stages' array once to populate the frequency array.
3. Calculate the failure rate for each stage (1 to N). If 'challenge' (total players who reached the stage) is 0, the loop safely breaks, leaving the remaining rates at their default 0.
4. Sort the stages from 1 to N based on their computed failure rates in descending order.
"""

def solution(N, stages):
    fails = [0 for _ in range(N+1)]
    for stage in stages:
        fails[stage - 1] += 1
    
    rate = [0 for _ in range(N)]
    challenge = len(stages)
    for i in range(N):
        if challenge == 0:
            break
        rate[i] = fails[i] / challenge
        challenge -= fails[i]
    return sorted(range(1, N+1), key=lambda x: rate[x-1], reverse=True)