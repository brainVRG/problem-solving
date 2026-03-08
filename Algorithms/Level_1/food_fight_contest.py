"""
Problem Name: Food Fight Contest (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/134240
Time Complexity: O(L) where L is the length of the final string
Space Complexity: O(L)

[Approach]
1. Iterate through the 'food' array starting from index 1, using 'enumerate' to get the food type (index + 1) and its quantity.
2. Calculate the usable amount of each food by dividing its quantity by 2 (`count // 2`) and append the corresponding food number to the 'answer' string.
3. Append '0' to represent the water placed at the center.
4. Append the mirrored version of the food arrangement by slicing `answer[-2::-1]`, which cleverly reverses the string while skipping the recently added '0'.

"""

def solution(food):
    answer = ''
    for i, count in enumerate(food[1:]):
        answer += str(i+1) * (count//2)
    answer += '0'
    answer += answer[-2::-1]
    return answer