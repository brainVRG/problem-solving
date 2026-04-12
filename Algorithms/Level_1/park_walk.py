"""
Problem Name: Park Walk (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/172928
Time Complexity: O(H * W + R * N)
Space Complexity: O(1)

[Approach]
1. Locate the starting coordinate 'S' in the park grid.
2. Iterate through each route command to calculate the intended destination.
3. Check boundary conditions and simulate the movement step-by-step to ensure no obstacles ('X') are in the path before updating the position.

[Retrospective]
Utilizing Python's `for...else` construct can eliminate the need for the `if time == times:` check, making the obstacle validation loop structurally cleaner.
"""

def solution(park, routes):
    
    # Direction by Cardinal
    direction_vec = {"N": [-1, 0], "S": [1, 0], "W": [0, -1], "E": [0, 1]}
    
    # Find Starting Location
    position = [0, 0]
    for i,p in enumerate(park):
        start_location = p.find("S")
        if start_location != -1:
            position = [i, start_location]
            break
    
    # Find Height, Width
    height = len(park)
    width = len(park[0])
    
    for route in routes:
        # Find Direction by Cardinal and Moving Times
        direction = route[0]
        h_direction = direction_vec[direction][0]
        w_direction = direction_vec[direction][1]
        times = int(route[2])
        
        # Check After Total Move Location is In Park
        after_move = [position[0] + h_direction * times, position[1] + w_direction * times]
        if 0 <= after_move[0] <= height - 1 and 0 <= after_move[1] <= width -1:
            # Check for Obstacles
            for time in range(1, times + 1):
                after_one_move = [position[0] + h_direction * time, position[1] + w_direction * time]
                if park[after_one_move[0]][after_one_move[1]] == "X":
                    break
                if time == times:
                    position = after_move
                
    return position