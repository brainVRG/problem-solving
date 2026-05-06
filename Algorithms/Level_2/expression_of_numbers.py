"""
Problem Name: Expression of Numbers (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/12924
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. Use the mathematical property of arithmetic progressions where n = x + (x+1) + ... + (x+i).
2. Accumulate the sum of increments (0 to i) into `until_sum`.
3. Check if the remaining difference `n - until_sum` is perfectly divisible by the number of terms `i + 1` to confirm a valid consecutive sequence.

[Retrospective]
Adding a `break` statement when `until_sum >= n` will optimize the time complexity from O(N) to O(sqrt(N)) by stopping unnecessary iterations.
"""

def solution(n):
    until_sum = 0
    count = 0
    for i in range(0, n):
        until_sum += i
        if n > until_sum and (n - until_sum) % (i + 1) == 0:
            count += 1
    return count