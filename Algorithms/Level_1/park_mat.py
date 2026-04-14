"""
Problem Name: Park (PCCE Past Exam Question 10)
https://school.programmers.co.kr/learn/courses/30/lessons/340198
Time Complexity: O(K * R * C * M^2) 
Space Complexity: O(1)

[Approach]
1. Sort `mats` in descending order to prioritize finding the largest possible mat.
2. Iterate through all valid top-left coordinates `(row, col)` in the `park` for each mat size.
3. Use a helper function `check` to verify if the square area of size `m` contains only empty spaces ("-1").

[Retrospective]
Applying Dynamic Programming (the 'Maximal Square' algorithm) to precompute the largest empty square at each cell can reduce the grid validation time complexity from O(R * C * M^2) to O(R * C).
"""

def solution(mats, park):
    
    def check(m, row, col):
        for i in range(row, row + m):
            for j in range(col, col + m):
                if park[i][j] != "-1":
                    return False
        return True

    for mat in sorted(mats, reverse = True):
        for row in range(0, len(park) - mat + 1):
            for col in range(0, len(park[0]) - mat + 1):
                if check(mat, row, col):
                    return mat
    
    return -1