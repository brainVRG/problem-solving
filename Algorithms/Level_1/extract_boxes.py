"""
Problem Name: Extract Boxes (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/389478
Time Complexity: O(1)
Space Complexity: O(1)

[Approach]
1. Calculate the vertical layer indices (`under` and `height`) using floor division.
2. Determine the exact column indices for `num` and `n` by checking if their respective layers are even (left-to-right) or odd (right-to-left).
3. Calculate the total boxes to remove by finding the height difference, adding 1 if the uppermost layer spans across the target column.

[Retrospective]
Extracting the column index calculation into a small helper function (e.g., `def get_col(box_num):`) would remove the duplicated even/odd parity logic for `num` and `n`.
"""

def solution(n, w, num):
    # Calculate the height of target box and total height
    under = (num - 1) // w
    height = (n - 1) // w

    # Calculate the column index for target
    if under % 2 == 0:
        idx = (num - 1) % w
    else:
        idx = w - 1 - ((num - 1) % w)
    
    # Calculate the column index for top box and determine if we need to add 1 (Default is 0)
    add = 0
    if height % 2 == 0:
        n_idx = (n - 1) % w
        if n_idx >= idx:
            add = 1
    else:
        n_idx = w - 1 - ((n - 1) % w)
        if n_idx <= idx:
            add = 1
            
    return height - under + add