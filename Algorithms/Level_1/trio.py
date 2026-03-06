"""
Problem Name: Trio (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/131705
Time Complexity: O(N^3)
Space Complexity: O(1)

[Approach]
1. Use the 'combinations' function from the 'itertools' library to generate all possible triplets from the student numbers.
2. Iterate through each generated combination.
3. Check if the sum of the triplet equals 0, and increment the answer counter if it does.
"""

from itertools import combinations

def solution(number):
    answer = 0
    student_combinations = combinations(number, 3)
    
    for comb in student_combinations:
        if sum(comb) == 0:
            answer += 1
            
    return answer