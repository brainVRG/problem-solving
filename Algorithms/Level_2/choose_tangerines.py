"""
Problem Name: Choose Tangerines (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/138476
Time Complexity: O(N log N)
Space Complexity: O(N)

[Approach]
1. Use `collections.Counter` to calculate the frequency of each tangerine size.
2. Sort the items of the counter by frequency in descending order to apply a greedy approach (always picking the size with the largest quantity first).
3. Iterate through the sorted list, subtracting the frequency from `k` and incrementing the `types` counter until `k` becomes 0 or less.

[Retrospective]
Instead of manually sorting `count.items()` with a lambda function, utilizing the built-in `count.most_common()` method provided by the `Counter` class makes the code more Pythonic and concise. Additionally, iterating directly over the frequencies in a `for` loop (e.g., `for _, freq in count.most_common():`) eliminates the need for manual `idx` tracking.
"""

from collections import Counter

def solution(k, tangerine):
    count = Counter(tangerine)
    count = sorted(count.items(), key = lambda x: x[1], reverse = True)
    
    types = 0
    idx = 0
    
    while k > 0:
        k -= count[idx][1]
        idx += 1
        types += 1
        
    return types