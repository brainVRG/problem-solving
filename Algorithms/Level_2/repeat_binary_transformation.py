"""
Problem Name: Repeat Binary Transformation (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/70129
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Initialize counters for the transformation loop and removed zeros.
2. Use a while loop that continues until the string `s` becomes "1".
3. Calculate the number of removed zeros by comparing the string length before and after removing "0"s, then convert the remaining length into a binary string.

[Retrospective]
Using `s.count("0")` calculates the removed zeros more efficiently without string replacement.
"""

def solution(s):
    
    # Var. for Counting loop and 0
    loop_count = 0
    zero_count = 0
    
    # Until s gets to '1', count the loop, determine 0 count by len. diff. of replacing 0
    while True:
        loop_count += 1
        before_length = len(s)
        s = s.replace("0", "")
        zero_count += before_length - len(s)
        s = str(format(len(s), "b"))
        
        if s == "1":
            break
            
    return [loop_count, zero_count]