"""
Problem Name: Make Minimum Value (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/12941
Time Complexity: O(N log N)
Space Complexity: O(N)

[Approach]
1. Sort array A in ascending order.
2. Sort array B in descending order.
3. Multiply the elements of A and B at the same index and sum them up to ensure the smallest products.

[Retrospective]
Replacing the for-loop with the `zip()` function and `sum()` (e.g., `sum(a * b for a, b in zip(A, B))`) makes the calculation more concise and Pythonic.
"""

def solution(A,B):
    answer = 0

    A.sort()
    B.sort(reverse = True)
    
    for i in range(len(A)):
        answer += A[i] * B[i]

    return answer