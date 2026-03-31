"""
Problem Name: Roughly Made Keyboard (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/160586
Time Complexity: O(K*L + T*M)
Space Complexity: O(1)

[Approach]
1. Build a dictionary recording the minimum keystrokes required for each character across all keymaps.
2. For each target, sum the required keystrokes using the dictionary.
3. If a character is not found in the dictionary, set the count to -1, break early, and append to the answer.
"""

def solution(keymap, targets):
    key_dict = {}
    for key in keymap:
        for i, c in enumerate(key):
            if c not in key_dict or key_dict[c] > i + 1:
                key_dict[c] = i + 1
                
    answer = []
    for target in targets:
        count = 0
        for c in target:
            if c in key_dict:
                count += key_dict[c]
            else:
                count = -1
                break
        answer.append(count)
        
    return answer