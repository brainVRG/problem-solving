"""
Problem Name: Cola Problem (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/132267
Time Complexity: O(log N)
Space Complexity: O(1)

[Approach]
1. Use a loop to simulate the exchange process.
2. Calculate the number of exchangeable batches (`div = n // a`).
3. If no batches can be exchanged, terminate the loop.
4. Otherwise, update the total number of bottles by subtracting the given bottles and adding the received ones.
5. Accumulate the newly received bottles into the answer.

[Retrospective]
The loop structure can be simplified by changing `while True:` to `while n >= a:`, which eliminates the need for the internal `if div <= 0: break` check.
Furthermore, this problem can be completely optimized to O(1) time complexity using mathematics. Since you lose `a` bottles and gain `b` bottles each time, the net loss per transaction is `a - b`. The total number of received bottles can be directly calculated as:
`return max(0, (n - b) // (a - b) * b)`
"""

def solution(a, b, n):
    answer = 0
    
    while True:
        div = n // a
        if div <= 0:
            break
        else:
            n -= div * a
            n += div * b
            answer += div * b
            
    return answer