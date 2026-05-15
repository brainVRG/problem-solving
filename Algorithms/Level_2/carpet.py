"""
Problem Name: Carpet (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/42842
Time Complexity: O(sqrt(N))  # N is the total number of tiles
Space Complexity: O(1)

[Approach]
1. Calculate the `total` number of tiles (brown + yellow).
2. Iterate through possible height values `i`, starting from 3 (since the minimum carpet with a center is 3x3) up to the square root of the total.
3. If `total` is perfectly divisible by `i`, calculate the corresponding width.
4. Verify if the mathematical condition for the border matches the given `brown` count. If it does, return the dimensions ordered as [width, height].
"""

def solution(brown, yellow):
    total = brown + yellow
    # Start from minimum length until maximum. We will always get correct answer until sqrt.
    for i in range(3, int(total ** (0.5)) + 1):
        if total % i == 0:
            # If outline block counts match brown.
            if i * 2 + ((total // i) - 2) * 2 == brown:
                return [max(i, total//i), min(i, total//i)]