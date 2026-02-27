"""
* Problem Name: 분수의 덧셈 (Programmers Level 0)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/120808
* Time Complexity: O(N) (where N is min(num1, num2))
* Space Complexity: O(1)

[Approach]
1. Calculate the non-reduced numerator (num1) and denominator (num2) by cross-multiplying.
2. Use a while loop to repeatedly find the smallest common divisor starting from 2 up to min(num1, num2).
3. Divide both numerator and denominator by the found common divisor and restart the loop.
4. Terminate and return the fraction if no common divisors are found.

[Retrospective / Future Improvement]
- Instead of iterating upwards from 2, iterating backwards from min(num1, num2) down to 1 
  would find the Greatest Common Divisor (GCD) in a single pass, significantly improving the time complexity.
"""

def solution(numer1, denom1, numer2, denom2):
    num1 = denom2 * numer1 + denom1 * numer2
    num2 = denom1 * denom2
    
    while True:
        max_num = min(num1, num2)
        if max_num == 1:
            return [num1, num2]
        
        for i in range(2, max_num + 1):
            if num1 % i == 0 and num2 % i == 0:
                num1 //= i 
                num2 //= i
                break
            
            if i == max_num:
                return [num1, num2]