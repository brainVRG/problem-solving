/*
Problem Name: Kth Number (Programmers Level 1)
https://school.programmers.co.kr/learn/courses/30/lessons/42748
Time Complexity: O(C * N log N)
Space Complexity: O(N)

[Approach]
1. Iterate through each command in the `commands` matrix.
2. Extract the specified sub-array using vector iterators.
3. Sort the sub-array in ascending order and append the target K-th element to the answer.

[Retrospective]
Using `std::nth_element` instead of `std::sort` optimizes the time complexity for finding the K-th element from O(N log N) to O(N).
*/

#include <string>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

vector<int> solution(vector<int> array, vector<vector<int>> commands) {
    vector<int> answer;
    
    for (auto& command : commands){
        vector<int> sub(array.begin() + command[0] - 1, array.begin() + command[1]);
        sort(sub.begin(), sub.end());
        answer.push_back(sub[command[2] - 1]);
    }
    return answer;
}