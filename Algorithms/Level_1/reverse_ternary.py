"""
Problem Name: Reverse Ternary (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/68935
Time Complexity: O(log N)
Space Complexity: O(log N)

[Approach]
1. Find the maximum power of 3 that is less than or equal to 'n'.
2. Loop downwards from that power to 0, using integer division to extract each ternary digit, and update 'n' with the remainder.
3. Reverse the resulting string and convert it back to a base-10 integer using `int(string, 3)`.

[Retrospective]
A standard base-conversion algorithm automatically yields the reversed string. 
By repeatedly taking the remainder (`n % 3`) and updating `n` (`n //= 3`), the digits are extracted from least significant to most significant.
This eliminates the need to calculate the maximum power of 3 beforehand and avoids the explicit string reversal step:

temp = ''
while n:
    temp += str(n % 3)
    n //= 3
return int(temp, 3)
"""

def solution(n):
    temp = ''
    
    a = 0
    while 3 ** (a + 1) <= n:
        a += 1
    
    for i in range(a, -1, -1):
        div = 3 ** i
        temp += str(n // div)
        n = n % div

    return int(temp[::-1], 3)