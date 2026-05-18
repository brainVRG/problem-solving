"""
Problem Name: Jump and Teleport (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/12980
Time Complexity: O(log N)
Space Complexity: O(1)

[Approach]
1. Work backwards from the destination `N` to the starting point `0`.
2. If the current distance is even, it means we could have reached here by teleporting, so divide `n` by 2 without increasing the battery cost.
3. If the current distance is odd, we must have jumped 1 step to reach it, so subtract 1 and increment the battery cost.
4. Repeat this process until `n` reaches 1.

[Retrospective]
1. Type Safety: Using integer division (`n //= 2`) instead of float division (`n /= 2`) is recommended to prevent unintended float type casting and improve execution speed.
2. Mathematical Insight: The logic of halving even numbers and subtracting 1 from odd numbers perfectly mirrors the process of decimal-to-binary conversion. Therefore, the minimum battery required is mathematically identical to the number of '1's in the binary representation of N. This can be solved in a single Pythonic line: `return bin(n).count('1')`.
"""

def solution(n):
    batt = 1
    while n != 1:
        if n % 2 == 0:
            n //= 2  # Optimized to integer division
        else:
            n -= 1
            batt += 1
            
    return batt