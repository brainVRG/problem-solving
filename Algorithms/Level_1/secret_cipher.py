"""
Problem Name: Secret Cipher (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/155652
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. Precompute a list of valid alphabet characters excluding those in 'skip'.
2. For each character in 's', find its index in the valid list.
3. Add the given 'index', apply modulo by the valid list's length to wrap around, and append.

[Retrospective]
The approach is highly optimal and Pythonic. For a slight readability boost, `string.ascii_lowercase` can be used instead of the ASCII range `chr(i)`:
`import string`
`valid = [c for c in string.ascii_lowercase if c not in skip]`
"""

def solution(s, skip, index):
    answer = ''
    
    valid = [chr(i) for i in range(97, 123) if chr(i) not in skip]
    valid_length = len(valid)
    
    for c in s:
        current_idx = valid.index(c)
        new_idx = (current_idx + index) % valid_length
        answer += valid[new_idx]
    
    return answer