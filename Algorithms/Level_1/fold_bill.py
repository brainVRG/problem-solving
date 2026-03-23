"""
Problem Name: Fold Bill [PCCE Problem 9] (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/340199
Time Complexity: O(log N) where N is the maximum dimension of the bill
Space Complexity: O(1)

[Approach]
1. Sort the wallet dimensions to explicitly define its maximum and minimum bounds.
2. Use a loop to check if the bill can fit into the wallet. The bill can be rotated, so compare the max/min dimensions of the bill directly with the max/min dimensions of the wallet.
3. If it doesn't fit, find the longer side of the bill, fold it in half using integer division, and increment the fold counter.
"""

def solution(wallet, bill):
    answer = 0
    wallet[0], wallet[1] = max(wallet), min(wallet)
    
    while max(bill) > max(wallet) or min(bill) > min(wallet):
        if bill[0] > bill[1]:
            bill[0] = bill[0] // 2
        else:
            bill[1] = bill[1] // 2
        answer += 1
        
    return answer