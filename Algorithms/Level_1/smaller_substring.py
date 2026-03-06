"""
Problem Name: Smaller Substring (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/147355
Time Complexity: O(N * M)
Space Complexity: O(M)

[Approach]
1. Iterate through the string 't' using a sliding window of the same length as 'p'.
2. Slice 't' to extract the substring and compare it directly with 'p'.
3. Increment the answer counter if the extracted substring is less than or equal to 'p'.
"""

def solution(t, p):
    answer = 0
    
    for i in range(len(t) - len(p) + 1):
        if t[i:i+len(p)] <= p:
            answer += 1

    return answer