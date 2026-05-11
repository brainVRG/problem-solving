"""
Problem Name: Fibonacci Number (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/12945
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. Initialize two variables, `a` and `b`, representing F(0) and F(1) respectively.
2. Iterate `n` times, simultaneously updating `a` to the next Fibonacci number and `b` to the sum of `a` and `b` modulo 1234567.
3. Return `a`, which holds the calculated `n`-th Fibonacci number.
"""

def solution(n):
    
    a, b = 0, 1
    for _ in range(n):
        a, b = b, (a + b) % 1234567

    return a