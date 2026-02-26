"""
* Problem Name: Dice Game 3 (Programmers Level 0)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/181916
* Time Complexity: O(1) (Fixed input size of 4 results in constant operations)
* Space Complexity: O(1) (The maximum size of the dictionary is limited to 4)

[Approach]
Count the frequency of each dice number using a dictionary, sort the items in descending order based on their frequencies, and return the score according to the given conditions.

[Retrospective / Future Improvement]
- Absolute Value Handling: When two pairs of dice show the same numbers, (p - q) can be negative. Added the abs() function to ensure the |p - q| condition is met and to make the logic robust.
- Pythonic Approach: In the future, utilizing the built-in collections.Counter and .most_common() could significantly simplify the counting and sorting process into a single line.
"""

def solution(a, b, c, d):
    count = {}
    for item in a, b, c, d:
        count[item] = count.get(item, 0) + 1
        
    count = sorted(count.items(), key=lambda x: x[1], reverse=True)        
    
    if len(count) == 1:
        return a * 1111
    elif len(count) == 2:
        if count[0][1] == 3:
            return (10 * count[0][0] + count[1][0]) ** 2
        else:
            # Modified: Added abs() to satisfy the |p - q| condition
            return (count[0][0] + count[1][0]) * abs(count[0][0] - count[1][0])
    elif len(count) == 3:
        return count[1][0] * count[2][0]
    else:
        return min(a, b, c, d)