"""
Problem Name: Card Deck (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/159994
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. Initialize three pointers to track the current positions in 'cards1', 'cards2', and 'goal'.
2. Loop indefinitely, checking if the goal index has reached the end, returning "Yes" if true.
3. Compare the current word in 'goal' with the current words in 'cards1' and 'cards2'.
4. To handle index out-of-bounds, append 'None' to the card lists when their respective pointers reach the end.
5. If the current goal word matches neither, return "No".

[Retrospective]
While appending 'None' cleverly prevents IndexError, modifying the input arrays is generally considered an anti-pattern. 
From a data structure perspective, this is equivalent to checking the front of two Queues. We can simply use a `for` loop to iterate through 'goal' and use logical short-circuiting to check index bounds safely. This removes the need for the 'j' variable and preserves the original lists:

i1, i2 = 0, 0
for word in goal:
    if i1 < len(cards1) and cards1[i1] == word:
        i1 += 1
    elif i2 < len(cards2) and cards2[i2] == word:
        i2 += 1
    else:
        return "No"
return "Yes"
"""

def solution(cards1, cards2, goal):
    i1 = 0
    i2 = 0
    j = 0
    
    while True:
        if j == len(goal):
            return "Yes"
        elif cards1[i1] == goal[j]:
            if i1 == len(cards1) - 1:
                cards1.append(None)
            i1 += 1
            j += 1
        elif cards2[i2] == goal[j]:
            if i2 == len(cards2) - 1:
                cards2.append(None)
            i2 += 1
            j += 1
        else:
            return "No"