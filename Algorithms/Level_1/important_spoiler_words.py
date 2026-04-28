"""
Problem Name: Important Spoiler Words
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Expand `spoiler_ranges` into a hash set containing all spoiled character indices.
2. Iterate through the words, track their exact starting indices, and determine if they intersect with the spoiler set.
3. Count the unique spoiler words that never appear in the common words set.

[Retrospective]
Using `re.finditer(r'\S+', message)` extracts words and their exact indices simultaneously, eliminating the inefficient repeated calls to `message.find()`.
"""

def solution(message, spoiler_ranges):
    
    # Mostly use set for time complexity.
    spoiler_indices = set(i for s in spoiler_ranges for i in range(s[0], s[1] + 1))
    words = message.split()
    previous_index = 0
    spoiler_words = []
    common_words = []
    
    # Traverse words and decide whether word is spoiler or common.
    for word in words:
        start_index = message.find(word, previous_index)
        word_range = set(range(start_index, start_index + len(word)))
        
        if not word_range.isdisjoint(spoiler_indices):
            spoiler_words.append(word)
        else:
            common_words.append(word)
            
        previous_index = start_index + len(word)
    
    # In non-duplicated spoiler words, find out whether spoiler word is in common words. If not, increase important words count by 1.
    spoiler_words = set(spoiler_words)
    common_words = set(common_words)
    important = 0
    
    for i in set(spoiler_words):
        if i not in common_words:
            important += 1
            
    return important