"""
Problem Name: Knight's Weapon (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/136798
Time Complexity: O(N * sqrt(N))
Space Complexity: O(1)

[Approach]
1. Define a helper function to count the number of divisors for a given integer by iterating up to its square root.
2. If the divisor 'i' perfectly divides 'n', increment the count. If 'i' is not the square root (i.e., i != n // i), increment again to account for the paired divisor.
3. Iterate through all knights from 1 to 'number'.
4. For each knight, determine their weapon's power based on their divisor count. If it exceeds the 'limit', use the restricted 'power' value instead.
5. Accumulate the required iron weight.

[Retrospective]
Calculating divisors for a continuous range of numbers from 1 to N can be further optimized using a sieve-like approach. 

divisor_counts = [0] * (number + 1)
for i in range(1, number + 1):
    for j in range(i, number + 1, i):
        divisor_counts[j] += 1
"""

import math

def solution(number, limit, power):
    answer = 0
    
    def get_divisor_num(n):
        count = 0
        for i in range(1, int(math.sqrt(n)) + 1):
            if n % i == 0:
                count += 1
                if i != n // i:
                    count += 1
        return count 
    
    for n in range(1, number+1):
        count = get_divisor_num(n)
        if count <= limit:
            answer += count
        else:
            answer += power
    
    return answer