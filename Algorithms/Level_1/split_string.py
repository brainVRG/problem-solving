"""
Problem Name: Split String (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/140108
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. Iterate through the string, using a 'flag' to mark the start of a new segment.
2. Count occurrences of the starting character ('x') versus other characters.
3. If the counts match or the string ends, increment the answer and reset.

[Retrospective]
The `flag` and index boundary checks can be eliminated. By implicitly starting a new segment and updating `x` exactly when the counts become equal, the code becomes much more concise:

ans, x_cnt, other_cnt = 0, 0, 0
for char in s:
    if x_cnt == other_cnt: 
        ans += 1
        x = char
    if char == x: x_cnt += 1
    else: other_cnt += 1
return ans
"""

def solution(s):
    answer = 0

    flag = 1
    x, x_count, count = 0, 0, 0
    
    for i in range(0, len(s)):
        if flag:
            x = s[i]
            x_count += 1
            flag = 0
        else:
            if s[i] == x:
                x_count += 1
            else:
                count += 1

        if i == len(s) - 1:
            answer += 1
        elif x_count == count:
            answer += 1
            flag = 1
            x_count, count = 0, 0
            
    return answer