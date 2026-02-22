"""
* Problem Name: Safe Zone (Programmers Level 0)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/120866
* Time Complexity: O(N^2)
* Space Complexity: O(1) (In-place modification)

[Approach]
1. Brute-force & Implementation.
2. Iterate through the N x N board. When a mine (1) is found, increment the danger count.
3. Check the 3x3 adjacent area around the mine using nested loops (range(-1, 2)).
4. If an adjacent cell is within the board boundaries and is currently safe (0), 
   mark it as a danger zone (-1) to avoid duplicate counting, and increment the count.
5. Return the number of safe zones by subtracting the danger count from the total cells (N^2).
"""

def solution(board):
    count = 0
    n = len(board)
    
    for row in range(n):
        for col in range(n):
            case = board[row][col]
            
            if case == 1:
                count += 1

                for row_add in range(-1, 2):
                    for col_add in range(-1, 2):
                        check_row = row + row_add
                        check_col = col + col_add
                        
                        if (check_row > -1) and (check_col > -1) and (check_row < n) and (check_col < n):
                            if board[check_row][check_col] == 0:
                                board[check_row][check_col] = -1
                                count += 1      
                                
    return n**2 - count