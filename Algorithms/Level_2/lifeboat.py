"""
Problem Name: Lifeboat (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/42885
Time Complexity: O(N log N)
Space Complexity: O(N)  # Timsort auxiliary space

[Approach]
1. Sort the `people` array in descending order to process the heaviest individuals first.
2. Use a Two-Pointer approach: `left` pointing to the heaviest person and `right` pointing to the lightest.
3. For each iteration (which represents one lifeboat), always put the heaviest person (`left`) on the boat.
4. Check if the lightest person (`right`) can also fit in the same boat. If they do, decrement the `right` pointer to indicate they are boarded.
5. Increment the `left` pointer and the total boat `count` in every iteration until all people are rescued.

[Retrospective]
The code is already highly optimal. The explicit check `left != right` is a great safety measure to prevent evaluating the same person twice when only one person is left.
"""

def solution(people, limit):
    count = 0
    # Sort people by weight in descending order
    people.sort(reverse=True)
    
    left = 0
    right = len(people) - 1
    
    # Calculate boat usage per iteration
    while left <= right:
        # If the heaviest and lightest person can fit together, put them in the same boat
        if left != right and people[left] + people[right] <= limit:
            right -= 1
        left += 1
        count += 1
        
    return count