"""
Problem Name: Nearest Same Letter (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/142086
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Initialize an empty list 'answer' for the results and a dictionary 'found' to act as a hash map storing the last seen index of each character.
2. Iterate through the string using 'enumerate' to get both index and character.
3. If the character exists in the dictionary, calculate the distance from its last seen index. Otherwise, append -1.
4. Update the dictionary with the current character's new index.

[Retrospective]
The algorithm is optimal with O(N) time complexity. To strictly adhere to the DRY (Don't Repeat Yourself) principle, the dictionary update step `found[c] = i` can be moved outside the `if-else` block since it is executed in both cases:

if c in found:
    answer.append(i - found[c])
else:
    answer.append(-1)
found[c] = i
"""

def solution(s):
    answer = []
    found = {}
    
    for i, c in enumerate(s):
        if c in found:
            answer.append(i - found[c])
            found[c] = i
        else:
            answer.append(-1)
            found[c] = i
            
    return answer