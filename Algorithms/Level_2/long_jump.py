"""
Problem Name: Long Jump (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/12914
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. The number of ways to reach step `n` by jumping 1 or 2 steps is the sum of the ways to reach step `n-1` and step `n-2`. This perfectly mirrors the Fibonacci sequence.
2. Handle the base cases explicitly where `n == 1` or `n == 2`.
3. Use two variables (`one_previous`, `two_previous`) to keep track of the last two states instead of an array, iterating up to `n` to find the total combinations.
4. Return the final answer modulo 1234567 as required.

[Retrospective]
Applying the modulo operation (`% 1234567`) inside the loop (e.g., `curr = (one_previous + two_previous) % 1234567`) is recommended. While Python automatically handles arbitrarily large integers, calculating the modulo at each step prevents large integer arithmetic overhead and memory expansion. Additionally, tuple unpacking (`two_previous, one_previous = one_previous, curr`) can make the variable swapping more concise.
"""

def solution(n):
    # Base cases for n = 1 and n = 2
    if n == 1:
        return 1
    if n == 2:
        return 2
    
    # Variables to store the previous two step counts
    one_previous = 2
    two_previous = 1
    
    # Calculate combinations using the Fibonacci sequence logic
    for _ in range(3, n+1):
        curr = one_previous + two_previous
        two_previous = one_previous
        one_previous = curr
            
    return one_previous % 1234567