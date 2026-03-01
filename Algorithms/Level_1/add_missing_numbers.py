"""
Problem Name: Add Missing Numbers (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/86051
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. The total sum of integers from 0 to 9 is fixed at 45.
2. Calculate the sum of the elements currently in the 'numbers' array.
3. Subtract the array's sum from 45 to directly yield the sum of the missing numbers.
"""

def solution(numbers):
    sum_0_to_9 = 45
    sum_numbers = sum(numbers)
    return sum_0_to_9 - sum_numbers