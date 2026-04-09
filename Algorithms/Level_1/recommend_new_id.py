"""
Problem Name: Recommend New ID (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/72410
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Execute the 7 steps sequentially as explicitly described in the problem statement.
2. Use string manipulation methods (`lower()`, `replace()`, `strip()`) and string slicing to format the ID.
3. Use loops to handle repetitive condition checks, such as replacing consecutive dots and padding the length.
"""

def solution(new_id):    
    first = new_id.lower()
    
    second = ""
    for c in first:
        if c.isalpha() or c.isdigit() or c in ("-", "_", "."):
            second += c
    
    third = second
    while ".." in third:
        third = third.replace("..", ".")
    
    fourth = third.strip(".")
    
    fifth = fourth if fourth else "a"
    
    if len(fifth) >= 16:
        fifth = fifth[:15]
        while fifth and fifth[-1] == ".":
            fifth = fifth[:-1]
    sixth = fifth
    
    while len(sixth) <= 2:
        sixth += sixth[-1]
    seventh = sixth

    return seventh