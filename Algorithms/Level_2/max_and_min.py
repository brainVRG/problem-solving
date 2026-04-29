"""
Problem Name: Max and Min (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/12939
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Split the input string `s` by spaces and convert each element to an integer.
2. Find the minimum and maximum values from the resulting integer list.
3. Convert the min and max back to strings and concatenate them with a space in between.

[Retrospective]
Using an f-string (e.g., `f"{min(numbers)} {max(numbers)}"`) provides better readability and performance than string concatenation using the `+` operator.
"""

def solution(s):
    numbers = [int(num) for num in s.split()]
    return str(min(numbers)) + " " + str(max(numbers))