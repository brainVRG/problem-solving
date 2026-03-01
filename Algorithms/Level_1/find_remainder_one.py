"""
Problem Name: Find a Number that Leaves a Remainder of 1 (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/87389
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. Iterate through numbers starting from 1 up to n - 1.
2. Check if the remainder of n divided by the current number (i) equals 1.
3. Return the first matching number, ensuring it is the smallest possible natural number.

[Retrospective]
Since n % 1 is always 0, starting the loop from 2 (`range(2, n)`) would be a slight logical optimization, though the current time complexity remains O(N) and easily passes the tests.
"""

def solution(n):
    for i in range(1, n):
        if n % i == 1:
            return i