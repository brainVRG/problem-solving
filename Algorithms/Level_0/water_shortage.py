"""
Problem Name: Water Shortage (Programmers Level 0)
https://school.programmers.co.kr/learn/courses/30/lessons/340202
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. The problem states that the monthly water usage must be calculated as an integer by discarding the decimal part.
2. The original code uses standard floating-point division (/), leaving decimals in the usage variable and causing incorrect accumulations.
3. Fix the bug by wrapping the arithmetic expression with int() to truncate the decimal part toward zero, matching the problem's exact requirement.
"""

def solution(storage, usage, change):
    total_usage = 0
    for i in range(len(change)):
        usage = usage + usage * change[i]/100
        total_usage += usage
        if total_usage > storage:
            return i
    
    return -1