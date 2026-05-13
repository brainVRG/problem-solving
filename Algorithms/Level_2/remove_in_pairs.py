"""
Problem Name: Remove in Pairs (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/12973
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Initialize an empty list to act as a stack.
2. Iterate through each character in the string `s`.
3. If the stack is not empty and the top of the stack matches the current character, pop the element from the stack (removing the pair).
4. Otherwise, push the current character onto the stack.
5. After the loop, return 1 if the stack is completely empty (all pairs removed), or 0 if elements remain.
"""

def solution(s):

    stack = []
    
    for c in s:
        if stack and stack[-1] == c:
            stack.pop()
        else:
            stack.append(c)        
            
    return 0 if stack else 1


# This code got time out due to string iter.
# def solution(s):

#     i = 0
#     while i < len(s):
#         if i>0:
#             if s[i] == s[i-1]:
#                 s = s[0:i-1]+s[i+1:]
#                 i -= 2
#         i += 1
            
#     return 0 if s else 1