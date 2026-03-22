"""
Problem Name: Fruit Seller (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/135808
Time Complexity: O(N log N)
Space Complexity: O(1)

[Approach]
1. Sort the 'score' array in descending order to bundle the most expensive apples together, maximizing profit.
2. Iterate through the sorted array using a step size of 'm'.
3. For each bundle of size 'm', extract the slice, find its minimum score, and multiply by 'm' to get the box price.
4. Accumulate the box prices into the total sum.

[Retrospective]
Since the array is already sorted in descending order, the minimum value in any contiguous sub-array of size 'm' is strictly its last element. 
Using `min()` and array slicing (`score[i:i+m]`) creates unnecessary overhead. We can achieve O(1) minimum retrieval by simply accessing the last element of each virtual box: `score[i + m - 1]`.
Furthermore, Python's extended slicing makes this incredibly concise and highly optimized at the C-level:
`return sum(score[m-1::m]) * m`
"""

def solution(k, m, score):
    score.sort(reverse = True)
    
    box_score_sum = 0
    for i in range(0, len(score) - m + 1, m):
        box_score_sum += min(score[i: i+m]) * m

    return box_score_sum