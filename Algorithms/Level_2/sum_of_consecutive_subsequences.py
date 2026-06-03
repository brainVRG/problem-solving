"""
Problem Name: Number of Sums of Consecutive Subsequences (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/131701
Time Complexity: O(N^3)
Space Complexity: O(N^2)

[Approach]
1. Multiply the `elements` array by 2 to easily simulate the circular nature of the sequence without needing complex modulo operations.
2. Use a `set` named `case` to automatically store unique sums and handle duplicates.
3. Iterate through all possible subsequence lengths `i` (from 1 to N) and all possible starting indices `j`.
4. Slice the array to the desired length, calculate the sum, and add it to the set.

[Retrospective]
Calling `sum()` inside the nested loops recalculates the sum of overlapping elements repeatedly, degrading the time complexity to O(N^3). 
This can be optimized to O(N^2) by calculating a running sum. By swapping the loops—fixing the starting index `i` first, and then incrementally increasing the length `j`—you can just add the next single element to the current sum instead of slicing and summing the entire sub-array from scratch:

for i in range(elements_len):
    current_sum = 0
    for j in range(elements_len):
        current_sum += round_elements[i + j]
        case.add(current_sum)
"""

def solution(elements):
    case = set()
    elements_len = len(elements)
    round_elements = elements * 2

    for i in range(1, elements_len + 1):
        for j in range(elements_len):
            case.add(sum(round_elements[j:j+i]))

    return len(case)