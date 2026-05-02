"""
Problem Name: Valid Parentheses (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/12909
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Initialize an `open_stack` to keep track of the open parentheses.
2. Iterate through the string, appending to the stack for every '(' and popping for every ')'.
3. If a ')' is encountered when the stack is empty, or if the stack is not empty after the loop, return False.

[Retrospective]
Replacing the list-based `open_stack` with a simple integer counter reduces space complexity from O(N) to O(1).
"""

def solution(s):
    open_stack = []
    for i in range(len(s)):
        if s[i] == "(":
            open_stack.append("(")
        else:
            if open_stack:
                open_stack.pop()
            else:
                return False
            
    if open_stack:
        return False
    else:
        return True