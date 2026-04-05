"""
Problem Name: Crane Claw Machine Game (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/64061
Time Complexity: O(M * N + M^2) worst case, where N is board size and M is moves length
Space Complexity: O(M) for the bucket and recursion stack

[Approach]
1. Iterate through the 'moves' array to drop the crane into the specified columns.
2. Scan the column top-down. If a doll (non-zero) is found, append it to the 'bucket', set the cell to 0, and break.
3. After all moves, use a recursive function 'check_pop' to scan the bucket backwards.
4. If adjacent identical dolls are found, slice them out of the list, add 2 to the answer, and recursively check again.

[Retrospective]
While the recursive post-processing works well within the given constraints, a more standard Stack approach can optimize this to O(M * N) time complexity. By checking if the newly picked doll matches the top of the bucket (bucket[-1]) *before* appending it, we can pop the matching doll immediately and avoid recursion and list shifting entirely.
"""

def solution(board, moves):
    answer = 0
    bucket = []

    for move in moves:
        for i in range(0, len(board)):
            if board[i][move-1]:
                bucket.append(board[i][move-1])
                board[i][move-1] = 0
                break
                
    def check_pop(bucket, i):
        nonlocal answer
        if i <= 0:
            return 
        else:
            if bucket[i] == bucket[i-1]:
                bucket[i-1:i+1] = []
                answer += 2
                check_pop(bucket, min(len(bucket)-1, i-1))
            else:
                check_pop(bucket, i - 1)

    if bucket:
        check_pop(bucket, len(bucket) - 1)
            
    return answer