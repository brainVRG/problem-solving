"""
Problem Name: Calculate the Shortfall (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/82612
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. Accumulate the total cost by multiplying the base price by the current ride iteration.
2. Compare the total accumulated cost with the available money.
3. Return 0 if the money is sufficient; otherwise, return the amount short.

[Retrospective]
The problem asks for the sum of an arithmetic sequence: price * (1 + 2 + ... + count).
This can be highly optimized to O(1) time complexity by using the formula for the sum of an arithmetic series:
total_price = price * (count * (count + 1) // 2).
Also, the return statement can be simplified to a one-liner using the max() function:
return max(0, total_price - money).
"""

def solution(price, money, count):
    total_price = 0
    for i in range(count):
        total_price += price * (i + 1)    
    
    if money >= total_price:
        return 0
    else:
        return total_price - money