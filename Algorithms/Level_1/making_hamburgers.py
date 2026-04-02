"""
Problem Name: Making Hamburgers (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/133502
Time Complexity: O(N^2) in worst case
Space Complexity: O(1)

[Approach]
1. Iterate through the list using a while loop.
2. Check if 4 consecutive elements match [1, 2, 3, 1].
3. If so, increment the answer, delete them, and step back by 3.

[Retrospective]
List slicing deletion (`ingredient[i:i+4] = []`) takes O(N), leading to O(N^2) overall. Using a Stack prevents element shifting and guarantees O(N) time:

stack = []
for i in ingredient:
    stack.append(i)
    if stack[-4:] == [1, 2, 3, 1]:
        answer += 1
        del stack[-4:]
"""

def solution(ingredient):
    answer = 0
    i = 0
    
    while i < len(ingredient) - 3:
        if ingredient[i] == 1 and ingredient[i + 1] == 2 and ingredient[i + 2] == 3 and ingredient[i + 3] == 1:
            answer += 1
            ingredient[i : i + 4] = []
            i = max(0, i - 3)
        else:
            i += 1
    
    return answer