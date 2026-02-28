"""
* Problem Name: Sum of Consecutive Numbers (Programmers Level 0)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/120923
* Time Complexity: O(N) 
* Space Complexity: O(N) 
"""

def solution(num, total):
    to_be_divided = total - sum(range(1,num))
    return [x for x in range(to_be_divided // num, to_be_divided // num + num  )]