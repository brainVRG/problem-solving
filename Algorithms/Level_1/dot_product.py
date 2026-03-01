"""
Problem Name: Dot Product (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/70128
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. Initialize a variable to accumulate the dot product.
2. Iterate through the indices of the arrays.
3. Multiply the elements at the same index from arrays 'a' and 'b', and add the result to the accumulator.

[Retrospective]
A more Pythonic way to iterate through two lists simultaneously is using the `zip()` function:
`return sum(x * y for x, y in zip(a, b))`
"""

def solution(a, b):
    dot_product = 0
    for i in range(len(a)):
        dot_product += a[i] * b[i]
    return dot_product