"""
Problem Name: Receive Report Results (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/92334
Time Complexity: O(U + R)
Space Complexity: O(U + R)

[Approach]
1. Initialize dictionaries to track the set of unique reporters for each user (`acc_report`) and the email notification counts (`output_email`).
2. Iterate through `report` and use a `set` to record who reported whom, automatically handling duplicate reports.
3. Iterate through `id_list`, and if a user's unique reporter count is >= `k`, increment the email count for all users in that reporter set.

[Retrospective]
Calling `r.split()` twice inside the loop is redundant; unpacking it once via `reporter, reported = r.split()` will optimize string processing time.
"""

def solution(id_list, report, k):
    acc_report = {}
    output_email = {}
    
    for i in id_list:
        acc_report[i] = set()
        output_email[i] = 0
    
    # Count non-duplicated reports per user
    for r in report:
        acc_report[r.split()[1]].add(r.split()[0])
    
    # If reported more than k, increase ouput email
    for i in id_list:
        reported = acc_report[i]
        if len(reported) >= k:
            for r in reported:
                output_email[r] += 1

    return list(output_email.values())