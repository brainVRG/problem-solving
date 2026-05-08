"""
Problem Name: Target Number (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/43165
Time Complexity: O(2^N)
Space Complexity: O(N)

[Approach]
1. Use Depth-First Search (DFS) to explore all combinations of adding and subtracting elements.
2. Track the cumulative `value` and current `index` recursively.
3. Once the index reaches the array's length, check if the value matches the `target` to increment the count.

[Retrospective]
Returning the sum of the two recursive calls directly (e.g., `return adding(v+n, i+1) + adding(v-n, i+1)`) eliminates the need for the `nonlocal` state variable.
"""

def solution(numbers, target):
    count = 0
    
    def adding(value, index):
        nonlocal count

        if index == len(numbers):
            if value == target:
                count += 1
            return 0
            
        adding(value + numbers[index], index+1)
        adding(value - numbers[index], index+1)
        
    adding(0,0)
    
    return count