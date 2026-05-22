"""
Problem Name: Double Priority Queue (Programmers Level 3)
https://school.programmers.co.kr/learn/courses/30/lessons/42628
Time Complexity: O(N^2 log N) worst-case (due to sorting in every iteration)
Space Complexity: O(N)

[Approach]
1. Parse each operation to determine if it's an Insert ('I') or Delete ('D').
2. For 'I', append the integer to the list.
3. For 'D 1', remove the maximum value (the last element).
4. For 'D -1', remove the minimum value (the first element).
5. Crucially, sort the list after every operation so that `pop()` and `pop(0)` always target the max and min values.

[Retrospective]
While this array-based approach passes the specific test cases on Programmers, it is highly inefficient for a large number of operations. `answer.sort()` takes O(K log K) and `pop(0)` takes O(K) time, causing the overall time complexity to balloon. 

To achieve the optimal O(N log N) time complexity required for a true "Double Priority Queue":
1. Use two separate heaps using Python's `heapq`: a `min_heap` and a `max_heap` (by negating values).
2. Maintain a boolean array (or dictionary) to track which elements have been logically deleted.
3. When popping, discard elements from the top of the heap if they are marked as deleted in the other heap.
Alternatively, using `bisect.insort()` for insertions would at least reduce the O(N log N) sorting step to an O(N) insertion step.
"""

def solution(operations):
    answer = []
    
    # Iterate through the operations
    for op in operations:
        order, number = op.split()
        
        # I (Insert) operation
        if order == "I":
            answer.append(int(number))
            
        # D (Delete) operation based on max/min condition
        elif order == "D":
            if number == "1":
                if answer:
                    answer.pop()
            else:
                if answer:
                    answer.pop(0)
        
        # Always keep the list sorted to maintain priority
        answer.sort()
    
    if answer:
        return [max(answer), min(answer)]
    else:
        return [0, 0]