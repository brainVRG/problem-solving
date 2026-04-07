"""
Problem Name: Personality Type Test (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/118666
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. Initialize a dictionary to track scores for all 8 personality types.
2. Loop through `survey` and `choices` to update scores based on the given choice value.
3. Compare the scores for each of the 4 personality indicators and append the higher-scoring (or alphabetically earlier) type to the result string.

[Retrospective]
The score earned can be calculated directly using `abs(choice - 4)`. Specifically, for `choice < 4`, the score is simply `4 - choice`, which eliminates the need for nested if-else statements. Additionally, since the pairs in `orders` are already sorted alphabetically, calling `sorted(order)[0]` is redundant and can be replaced with `order[0]`.
"""

def solution(survey, choices):
    answer = ''
    score = {}
    
    orders = [['R', 'T'], ['C', 'F'], ['J', 'M'], ['A', 'N']]
    for order in orders:
        score[order[0]] = 0
        score[order[1]] = 0
    
    for i in range(len(survey)):
        question = survey[i]
        choice = choices[i]

        if choice > 4:
            score[question[1]] += choice % 4
        elif choice < 4:
            if choice == 2:
                pass
            else:
                choice = 3 if choice == 1 else 1
            score[question[0]] += choice
            
    for order in orders:
        if score[order[0]] == score[order[1]]:
            answer += sorted(order)[0]
        elif score[order[0]] > score[order[1]]:
            answer += order[0]
        else:
            answer += order[1]
            
    return answer