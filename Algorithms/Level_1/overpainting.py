"""
Problem Name: Overpainting (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/161989
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Create a 'wall' array filled with 1s representing painted areas. Add 'm - 1' padding to the end to prevent index out-of-bounds during slicing.
2. Iterate through the 'section' array and mark the unpainted sections on the 'wall' array with 0.
3. Iterate through the 'wall'. When a 0 is found, simulate the roller painting by slicing the next 'm' blocks and filling them with 1s, then increment the count.

[Retrospective]
While the array simulation is highly intuitive and the padding trick is clever, creating a list of size N (up to 100,000) uses unnecessary memory and time.
Since the 'section' array is already sorted, a Greedy approach provides the optimal solution. By only iterating through the 'section' array and tracking the furthest coordinate the roller has reached, we can solve this in O(K) time (where K is the length of 'section') and O(1) space:

count = 0
painted_end = 0
for s in section:
    if s > painted_end:
        count += 1
        painted_end = s + m - 1
return count
"""

def solution(n, m, section):
    wall = [1 for _ in range(n + m - 1)]
    
    for s in section:
        wall[s-1] = 0

    count = 0
    for i in range(n):
        if wall[i] == 0:
            wall[i : i + m] = [1 for _ in range(m)]
            count += 1
    
    return count