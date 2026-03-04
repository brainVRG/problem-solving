"""
Problem Name: Number of Divisors and Addition (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/77884
Time Complexity: O(N * M)
Space Complexity: O(1)

[Approach]
1. Loop through the given range from 'left' to 'right'.
2. For each number, count its divisors by iterating from 1 to the number itself.
3. Add the number to the answer if the divisor count is even; otherwise, subtract it.

[Retrospective]
A number has an odd number of divisors if and only if it is a perfect square (e.g., 16 = 4^2). 
Instead of counting all divisors, we can check this in O(1) time:
`if int(num**0.5) == num**0.5:` (Subtract the number if true, else add it).
This eliminates the inner loop and improves the overall time complexity.
"""

def solution(left, right):
    answer = 0
    
    for num in range(left, right+1):
        count = 0
        for i in range(1, num+1):
            if num % i == 0:
                count += 1
        if count % 2 == 0:
            answer += num
        else:
            answer -= num

    return answer