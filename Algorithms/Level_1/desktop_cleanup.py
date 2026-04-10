"""
Problem Name: Desktop Cleanup (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/161990
Time Complexity: O(R * C)
Space Complexity: O(1)

[Approach]
1. Initialize variables to track the minimum and maximum row and column indices using infinity.
2. Iterate through every cell in the 2D grid `wallpaper`.
3. Whenever a file ("#") is found, update the top-left (min row, min col) and bottom-right (max row + 1, max col + 1) bounding box coordinates.
"""

def solution(wallpaper):
    answer = [float("inf"), float("inf"), float("-inf"), float("-inf")]
    
    for i in range(len(wallpaper)):
        for j in range(len(wallpaper[0])):
            if wallpaper[i][j] == "#":
                if i < answer[0]:
                    answer[0] = i
                if i+1 > answer[2]:
                    answer[2] = i+1
                if j < answer[1]:
                    answer[1] = j
                if j+1 > answer[3]:
                    answer[3] = j+1      
                    
    return answer