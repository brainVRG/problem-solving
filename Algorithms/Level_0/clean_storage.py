"""
* Problem Name: Clean Storage (Programmers PCCE)
* URL: https://school.programmers.co.kr/learn/courses/30/lessons/250126
* Time Complexity: O(N^2) (where N is the length of the storage list)
* Space Complexity: O(N)

[Approach]
1. Iterate through the `storage` list.
2. If the item already exists in `clean_storage`, find its index and add the quantity to `clean_num` at the same index.
3. If it is a new item, append the item to `clean_storage` and its quantity to `clean_num`.
4. Find the maximum quantity in `clean_num` and return the corresponding item from `clean_storage`.
"""

def solution(storage, num):
    clean_storage = []
    clean_num = []
    
    for i in range(len(storage)):
        if storage[i] in clean_storage:
            pos = clean_storage.index(storage[i])
            clean_num[pos] += num[i]  
        else:
            clean_storage.append(storage[i])
            clean_num.append(num[i])
            
    max_num = max(clean_num)
    answer = clean_storage[clean_num.index(max_num)]
    
    return answer