"""
Problem Name: Pressing Keypad (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/67256
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Map each keypad number to a 2D coordinate [row, column].
2. Iterate through the given `numbers`, immediately assigning the left thumb for 1, 4, 7 and the right thumb for 3, 6, 9.
3. For middle column numbers (2, 5, 8, 0), calculate the Manhattan distance from the current thumb positions to the target. Move the closer thumb, or use the preferred `hand` if the distances are equal.
"""

def solution(numbers, hand):
    answer = ''
    key_pad = {
        1 : [0, 0],
        2 : [0, 1],
        3 : [0, 2],
        4 : [1, 0],
        5 : [1, 1],
        6 : [1, 2],
        7 : [2, 0],
        8 : [2, 1],
        9 : [2, 2],
        0 : [3, 1]
    }
    left_position = [3, 0]
    right_position = [3, 2]
    
    for number in numbers:
        if number in (1, 4, 7):
            left_position = key_pad[number]
            answer += 'L'
        elif number in (3, 6, 9):
            right_position = key_pad[number]
            answer += 'R'
        else:
            left_len = abs(left_position[0] - key_pad[number][0]) + abs(left_position[1] - key_pad[number][1])
            right_len = abs(right_position[0] - key_pad[number][0]) + abs(right_position[1] - key_pad[number][1])

            if left_len == right_len:
                if hand == "right":
                    right_position = key_pad[number]
                    answer += 'R'
                else:
                    left_position = key_pad[number]
                    answer += 'L'
            elif left_len < right_len:
                left_position = key_pad[number]
                answer += 'L'   
            else:
                right_position = key_pad[number]
                answer += 'R'

    return answer