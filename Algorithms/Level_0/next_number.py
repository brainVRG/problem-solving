"""
Problem Name: Next Number (Programmers Level 0)
https://school.programmers.co.kr/learn/courses/30/lessons/120924
Time Complexity: O(1)
Space Complexity: O(1)

[Approach]
1. Check if the sequence is an arithmetic progression by comparing the average difference across the array with the difference between the first two elements.
2. If arithmetic, add the common difference to the last element.
3. Otherwise, it is a geometric progression. Multiply the last element by the common ratio.

[Retrospective]
A simpler way to identify an arithmetic sequence is `common[1] - common[0] == common[2] - common[1]`. 
"""

def solution(common):
    last_first_diff = common[-1] - common[0]
    sec_first_diff = common[1] - common[0]
    interval_length = len(common) - 1
    
    if last_first_diff % interval_length == 0 and sec_first_diff == last_first_diff // interval_length:
        return common[-1] + last_first_diff // interval_length
    
    return common[-1] ** 2 // common[-2]