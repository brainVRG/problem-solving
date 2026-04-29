"""
Problem Name: Make JadenCase String (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/12951
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Iterate through each character in the string `s`.
2. Use a boolean flag `is_first_chr` to track if the current character is the beginning of a new word.
3. Convert the character to uppercase if it is the first character, otherwise to lowercase, and update the flag.

[Retrospective]
Appending characters to a list and using `"".join()` at the end is more memory-efficient than using string concatenation (`+=`) inside a loop.
"""

def solution(s):
    answer = ""
    is_first_chr = True
    
    for c in s:
        if c.isspace():  # 1. Check for Space
            is_first_chr = True
        else:  
            if is_first_chr:  # If not space, determin upper/lower
                c = c.upper()
            else:
                c = c.lower()
            is_first_chr = False
        answer += c
    
    return answer