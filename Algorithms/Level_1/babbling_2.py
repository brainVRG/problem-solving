"""
Problem Name: Babbling (2) (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/133499
Time Complexity: O(N * M) where N is length of babbling, M is max string length
Space Complexity: O(1)

[Approach]
1. Define the 4 valid pronunciations.
2. Iterate through each word in the 'babbling' array.
3. For each valid pronunciation, check if it exists in the current word and does NOT appear consecutively (i.e., `p*2` is not in the word).
4. If valid, replace all occurrences of that pronunciation with a space (' ') instead of an empty string ("") to prevent adjacent characters from merging and forming false valid words (e.g., "m-aya-a" -> "ma").
5. Count the words that become completely empty when stripped of spaces.
"""

def solution(babbling):
    pronounce = ["aya", "ye", "woo", "ma"]
    
    for i in range(len(babbling)):
        for p in pronounce:
            if p in babbling[i]:
                if p*2 not in babbling[i]:
                    babbling[i] =  babbling[i].replace(p, ' ')
                
    count = 0
    for i in babbling:
        if len(i.strip()) == 0:
            count += 1

    return count