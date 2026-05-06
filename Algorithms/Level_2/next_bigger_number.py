"""
Problem Name: Next Bigger Number (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/12911
Time Complexity: O(K log N) 
Space Complexity: O(log N)

[Approach]
1. Count the number of '1's in the binary representation of the given number `n`.
2. Increment `n` by 1 iteratively.
3. Return the first incremented number that has the exact same count of '1's in its binary form.

[Retrospective]
Using bitwise operations (Gosper's hack) can mathematically calculate the next number in pure O(1) time complexity without loops.
"""

def solution(n):
    original_one_count = bin(n).count('1')
    while True:
        n += 1
        if original_one_count == bin(n).count('1'):
            return n