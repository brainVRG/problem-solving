"""
Problem Name: Memory Score (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/176963
Time Complexity: O(N + P * M) 
(N: length of name, P: number of photos, M: average people per photo)
Space Complexity: O(N + P)

[Approach]
1. Create a hash map (dictionary) pairing each name with its corresponding yearning score using `zip` and dictionary comprehension.
2. Iterate through each photo in the 2D 'photo' array.
3. For each person in the photo, safely add their score to the current photo's total using `dict.get(name, 0)` to handle missing names without throwing errors.
4. Append the calculated score to the answer list.
"""

def solution(name, yearning, photo):
    name_score = {n : y for n,y in zip(name, yearning)}
    answer = []
    
    for p in photo:
        score = 0
        for n in p:
            score += name_score.get(n, 0)
        answer.append(score)
        
    return answer