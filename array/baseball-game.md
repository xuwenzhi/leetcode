# baseball-game

[https://leetcode.com/problems/baseball-game/](https://leetcode.com/problems/baseball-game/)

```
You're now a baseball game point recorder.

Given a list of strings, each string can be one of the 4 following types:

Integer (one round's score): Directly represents the number of points you get in this round.
"+" (one round's score): Represents that the points you get in this round are the sum of the last two valid round's points.
"D" (one round's score): Represents that the points you get in this round are the doubled data of the last valid round's points.
"C" (an operation, which isn't a round's score): Represents the last valid round's points you get were invalid and should be removed.
Each round's operation is permanent and could have an impact on the round before and the round after.

You need to return the sum of the points you could get in all the rounds.

Example 1:

Input: ["5","2","C","D","+"]
Output: 30
Explanation:
Round 1: You could get 5 points. The sum is: 5.
Round 2: You could get 2 points. The sum is: 7.
Operation 1: The round 2's data was invalid. The sum is: 5.
Round 3: You could get 10 points (the round 2's data has been removed). The sum is: 15.
Round 4: You could get 5 + 10 = 15 points. The sum is: 30.
Example 2:

Input: ["5","-2","4","C","D","9","+","+"]
Output: 27
Explanation:
Round 1: You could get 5 points. The sum is: 5.
Round 2: You could get -2 points. The sum is: 3.
Round 3: You could get 4 points. The sum is: 7.
Operation 1: The round 3's data is invalid. The sum is: 3.
Round 4: You could get -4 points (the round 3's data has been removed). The sum is: -1.
Round 5: You could get 9 points. The sum is: 8.
Round 6: You could get -4 + 9 = 5 points. The sum is 13.
Round 7: You could get 9 + 5 = 14 points. The sum is 27.
Note:

The size of the input list will be between 1 and 1000.
Every integer represented in the list will be between -30000 and 30000.
```

# thinking

遍历字符串数组，使用一个数组存储分数，遇到 **C** 则进行**pop_back()**，遇到**D**，则push_back(record[record.size()-1, record.size()-2])，最后计算整个record的加和就完事了.

# solution

```c++
class Solution {
public:
    int calPoints(vector<string>& ops) {
        vector<int> record{};
        int cur = 0, len = ops.size();
        while (cur < len) {
            if (ops[cur] == "C") {
                record.pop_back();
            } else if (ops[cur] == "D") {
                record.push_back(2 * record.back());
            } else if (ops[cur] == "+") {
                record.push_back(record.back() + record[record.size()-2]);
            } else  {
                record.push_back(stoi(ops[cur]));
            }
            cur++;
        }

        return accumulate(record.begin(), record.end(), 0);
    }
};
```

Runtime: 8 ms, faster than 99.76% of C++ online submissions for Baseball Game.

Memory Usage: 9.1 MB, less than 100.00% of C++ online submissions for Baseball Game.
