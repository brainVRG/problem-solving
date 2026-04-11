"""
Problem Name: Personal Information Retention Period (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/150370
Time Complexity: O(N)
Space Complexity: O(N)

[Approach]
1. Parse the `terms` list into a dictionary, converting the valid month periods into days (months * 28).
2. Convert the `today` date string into an absolute cumulative day count starting from the year 2000.
3. Iterate through `privacies`, convert each start date to cumulative days, add the term's valid days, and append the 1-based index to the answer if this expiration date is less than or equal to `today`.

[Retrospective]
Extracting the duplicated date-to-days calculation logic into a helper function (e.g., `def date_to_days(date):`) will eliminate code duplication.
"""

def solution(today, terms, privacies):
    answer = []
    
    terms_dict = {}
    for term in terms:
        terms_dict[term.split()[0]] = int(term.split()[1]) * 28
    
    today_date = today.split(".")
    today_acc_date = 0
    today_acc_date += (int(today_date[0]) - 2000) * 12 * 28
    today_acc_date += (int(today_date[1]) - 1) * 28
    today_acc_date += int(today_date[2])
    
    for i, privacy in enumerate(privacies):
        privacy_dates, signed_term = privacy.split()
        privacy_date = privacy_dates.split(".")
        privacy_acc_date = 0
        privacy_acc_date += (int(privacy_date[0]) - 2000) * 12 * 28
        privacy_acc_date += (int(privacy_date[1]) - 1) * 28
        privacy_acc_date += int(privacy_date[2])
        privacy_acc_date += terms_dict[signed_term]
        
        if privacy_acc_date <= today_acc_date:
            answer.append(i + 1)
        
    return answer