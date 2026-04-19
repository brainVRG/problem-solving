"""
Problem Name: Video Player (PCCP Past Exam Question 1)
https://school.programmers.co.kr/learn/courses/30/lessons/340213
Time Complexity: O(N)
Space Complexity: O(1)

[Approach]
1. Convert all "mm:ss" formatted strings into total seconds.
2. Check and skip the opening segment if the initial position falls within the opening time.
3. Iterate through `commands`, updating the position by +10 or -10 seconds while using `min()` and `max()` for boundary limits.
4. After each command, check if the current position is within the opening segment and skip to `op_end` if necessary, then format the result back to "mm:ss".

[Retrospective]
Extracting the "mm:ss" to seconds conversion logic into a helper function (e.g., `def to_sec(time_str):`) will eliminate the fourfold repetitive string slicing code.
"""

def solution(video_len, pos, op_start, op_end, commands):
    # Calculate to Seconds
    video_len = int(video_len[:2]) * 60 + int(video_len[3:])
    pos = int(pos[:2]) * 60 + int(pos[3:])
    op_start = int(op_start[:2]) * 60 + int(op_start[3:])
    op_end = int(op_end[:2]) * 60 + int(op_end[3:])
    
    # Check for Initial Opening Position
    if op_start <= pos <= op_end:
        pos = op_end
        
    for command in commands:
        # Follow the Command and Check Video Start&End 
        if command == "next":
            pos = min(video_len, pos + 10)
        elif command == "prev":
            pos = max(0, pos - 10)
        
        # Check for Opening Position
        if op_start <= pos <= op_end:
            pos = op_end

    return str(pos // 60).zfill(2) + ":" + str(pos % 60).zfill(2)