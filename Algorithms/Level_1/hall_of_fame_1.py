"""
Problem Name: Hall of Fame (1) (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/138477
Time Complexity: O(N * K)
Space Complexity: O(K)

[Approach]
1. Iterate through the 'score' array day by day.
2. If the current day is within the first 'k' days, simply append the score to the 'board'.
3. For subsequent days, compare the current score with the lowest score on the 'board'. If it is strictly greater, remove the minimum score and append the new one.
4. Record the minimum score of the 'board' into the 'answer' list for each day.

[Retrospective]
While the current list-based approach works well within the constraints, finding and removing the minimum element takes O(K) time. 
This is a classic "Top K" problem, which is perfectly suited for a Min-Heap data structure. Using Python's `heapq` module allows us to maintain the top K scores efficiently, reducing the insertion/removal time to O(log K) and overall time complexity to O(N log K):

import heapq
def solution(k, score):
    answer = []
    board = []
    for s in score:
        heapq.heappush(board, s)
        if len(board) > k:
            heapq.heappop(board)
        answer.append(board[0])
    return answer
"""

def solution(k, score):
    answer = []
    board = []
    for i, s in enumerate(score):
        if i <= k-1:
            board.append(s)
            answer.append(min(board))
        else:
            if s > min(board):
                board.remove(min(board))
                board.append(s)
            answer.append(min(board))
    return answer