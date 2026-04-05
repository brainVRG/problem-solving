"""
Problem Name: Number Partner (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/131128
Time Complexity: O(N + M)
Space Complexity: O(1) auxiliary, O(K) for result string

[Approach]
1. Count the occurrences of each digit in strings X and Y using collections.Counter.
2. Iterate downwards from 9 to 0 to ensure the resulting number is the maximum possible.
3. Find the minimum count for each common digit and append it to the answer.
4. Handle edge cases: if the answer starts with '0' (meaning only '0's exist), limit the count to 1. If empty, return "-1".
"""
from collections import Counter

def solution(X, Y):
    x_count = Counter(map(int, X))
    y_count = Counter(map(int, Y))
    
    answer = ""
    for i in range(9, -1, -1):
        if x_count.get(i) and y_count.get(i):
            count = min(x_count.get(i), y_count.get(i))
            
            if i == 0 and len(answer) == 0:
                count = 1
                
            answer += str(i) * count
    
    if answer:
        return answer
    else:
        return "-1"