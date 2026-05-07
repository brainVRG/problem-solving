"""
Problem Name: More Spicy (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/42626
Time Complexity: O(N log N)
Space Complexity: O(N)

[Approach]
1. Convert the `scoville` array into a min-heap to efficiently access the two least spicy foods in O(1) and O(log N) operations.
2. Repeatedly pop the two smallest elements, calculate the new mixed scoville score, and push it back into the heap.
3. Keep tracking the mix count and terminate when the smallest element is greater than or equal to `K`, or return -1 if mixing is no longer possible.
"""

import heapq

def solution(scoville, K):
    loop_count = 0
    heapq.heapify(scoville)
    
    while len(scoville) > 1:
        if scoville[0] >= K:
            return loop_count
        
        a = heapq.heappop(scoville)
        b = heapq.heappop(scoville)
        heapq.heappush(scoville, a + b * 2)
        loop_count += 1
    
    if scoville[0] >= K:
        return loop_count    
    else:
        return -1