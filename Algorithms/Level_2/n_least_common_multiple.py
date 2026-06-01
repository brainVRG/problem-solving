"""
Problem Name: N Least Common Multiple (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/12953
Time Complexity: O(N log M)  # N: length of arr, M: max value in arr (due to Euclidean algorithm inside LCM)
Space Complexity: O(1)

[Approach]
1. Initialize the running LCM with the first element of the array.
2. Iterate through the remaining elements. This works due to the associative property of the Least Common Multiple: $\text{LCM}(a, b, c) = \text{LCM}(\text{LCM}(a, b), c)$.
3. Continuously update the running LCM by computing the LCM of the current accumulated value and the next number in the array.
4. Return the final accumulated result.
"""

from math import lcm

def solution(arr):
    before_lcm = arr[0]
    for num in arr[1:]:
        before_lcm = lcm(before_lcm, num)
    return before_lcm