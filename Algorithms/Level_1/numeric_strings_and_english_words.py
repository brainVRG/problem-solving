"""
Problem Name: Numeric Strings and English Words (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/81301
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Define a dictionary mapping English words for numbers (e.g., "zero", "one") to their corresponding integer values.
2. Iterate through each character of the string 's'.
3. If the character is a digit, append it directly to the 'answer' string.
4. If it's a letter, accumulate it in a buffer 'prev'. Once 'prev' matches a key in the dictionary, append its mapped value to 'answer' and clear the buffer.

[Retrospective]
While the character-by-character parsing logic is extremely solid, Python's built-in `str.replace()` provides a much more concise and highly optimized alternative for this specific problem. 
Iterating through the dictionary items and replacing the word with its digit counterpart drastically reduces the code length while maintaining O(N) time complexity since the dictionary size is fixed at 10:

for word, num in num_dict.items():
    s = s.replace(word, str(num))
return int(s)
"""

def solution(s):
    answer = ""
    num_dict = {"zero" : 0, "one" : 1, "two" : 2, "three" : 3, "four" : 4, "five" : 5, "six" : 6, "seven" : 7, "eight" : 8, "nine" : 9}

    prev = ""
    for c in s:
        if c.isdigit():
            answer += c
        else:
            prev += c
            if prev in num_dict:
                answer += str(num_dict[prev])
                prev = ""
                
    return int(answer)