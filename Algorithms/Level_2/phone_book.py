"""
Problem Name: Phone Book (Programmers Level 2)
https://school.programmers.co.kr/learn/courses/30/lessons/42577
Time Complexity: O(N * M)  # N: len(phone_book), M: max length of a phone number
Space Complexity: O(N * M)

[Approach]
1. Store all phone numbers in a hash map (dictionary) for O(1) average time complexity lookups.
2. Iterate through each phone number and build its prefix character by character.
3. Check if the generated prefix exists in the hash map. If it does, and it is not the number itself, return False.
"""

def solution(phone_book):
    hash_map = {hash_number : 1 for hash_number in phone_book}
    # O(N)
    for phone_number in phone_book:
        prefix = ""
        # O(M)
        for number in phone_number:
            prefix += number
            # O(1)
            if prefix in hash_map and prefix != phone_number:
                return False
    return True