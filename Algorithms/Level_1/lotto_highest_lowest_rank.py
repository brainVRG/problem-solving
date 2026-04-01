"""
Problem Name: Highest and Lowest Ranks of Lotto (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/77484
Time Complexity: O(1) (Array length is strictly 6)
Space Complexity: O(1)

[Approach]
1. Count the number of unreadable numbers (0s) in 'lottos'.
2. Count the matching numbers between 'lottos' and 'win_nums'.
3. Max wins = matches + 0s. Min wins = matches.
4. Convert the win counts to their corresponding ranks.

[Retrospective]
The multiple `if/elif` branches for ranking can be entirely replaced by a simple array indexing trick. Also, finding the matches is much cleaner using `set` intersection:

rank = [6, 6, 5, 4, 3, 2, 1]
blank = lottos.count(0)
min_win = len(set(lottos) & set(win_nums))
max_win = min_win + blank

return [rank[max_win], rank[min_win]]
"""

def solution(lottos, win_nums):
    answer = []

    min_win = 0
    blank = 0
    for lotto in lottos:
        if lotto == 0:
            blank += 1
        elif lotto in win_nums:
            win_nums.remove(lotto)
            min_win += 1
    max_win = min_win + min(blank, len(win_nums))
    
    def check_rank(win):
        if win == 6:
            return 1
        elif win == 5:
            return 2
        elif win == 4:
            return 3
        elif win == 3:
            return 4
        elif win == 2:
            return 5
        else:
            return 6
    
    return [check_rank(max_win), check_rank(min_win)]