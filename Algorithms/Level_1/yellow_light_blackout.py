"""
Problem Name: Yellow Light Blackout (Programmers PCCP 기출)
Time Complexity: O(LCM(cycles))
Space Complexity: O(Sum(cycles))

[Approach]
1. Calculate the total cycle time for each traffic light.
2. Create an expanded array (`sig_ex`) for each light, mapping each second to a state: 0 (Green), 1 (Yellow), or 2 (Red).
3. Determine the search limit. Since the maximum cycle length is 20, the Least Common Multiple (LCM) of up to 5 cycles is at most 20^5. However, multiplying all cycles (`sig_lengths`) gives an upper bound. 
4. Iterate through time, using the modulo operator to check if all lights concurrently have the state `1` (Yellow).

[Retrospective]
Instead of creating full arrays for each signal, calculating the state mathematically using modulo arithmetic `(time % cycle_length)` directly within the loop would reduce space complexity to O(1) and improve execution speed.
"""

def solution(signals):
    
    # Find all multiplied length for all sigs
    # Find single color pattern for all sigs
    sig_lengths = 1
    sig_ex = [[] for _ in range(len(signals))]
    for i, sig in enumerate(signals):
        sig_lengths *= sum(sig)
        sig_ex[i].extend([0 for _ in range(sig[0])])
        sig_ex[i].extend([1 for _ in range(sig[1])])
        sig_ex[i].extend([2 for _ in range(sig[2])])

    # Iterate for all possible length combinations. If we find all sigs is yellow, then return time.
    for time in range(sig_lengths):
        is_all_yellow = 1
        for sig in sig_ex:
            color = sig[time % len(sig)]
            if color != 1:
                is_all_yellow = 0
                break
        if is_all_yellow:
            return time + 1
        
    return -1