"""
Problem Name: Add Negative and Positive (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/76501
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. Iterate through the arrays using their indices.
2. Add the value to the total sum if the corresponding sign is True; subtract if False.
"""

def solution(absolutes, signs):
    total_sum = 0
    for i in range(len(absolutes)):
        total_sum += absolutes[i] if signs[i] else -absolutes[i]
    return total_sum