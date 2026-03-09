"""
Problem Name: Pick Two and Add (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/68644
Time Complexity: O(N^2 log N)
Space Complexity: O(N^2)

[Approach]
1. Use 'combinations' from the 'itertools' library to generate all possible pairs from the 'numbers' array.
2. Calculate the sum of each pair and store the results in a 'set' to automatically remove any duplicate values.
3. Sort the unique sums in ascending order and return the result.

[Retrospective]
The built-in `sorted()` function in Python always returns a new list, regardless of the input iterable type. Therefore, explicitly casting the set to a list using `list()` is redundant.
The code can be optimized and shortened using a set comprehension directly inside `sorted()`:
`return sorted({i + j for i, j in combinations(numbers, 2)})`
"""

from itertools import combinations

def solution(numbers):
    num_comb = combinations(numbers, 2)  
    return sorted(list(set([i+j for i,j in num_comb])))