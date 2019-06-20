# summary-ranges

[https://leetcode.com/problems/summary-ranges/](https://leetcode.com/problems/summary-ranges/)

```
Given a sorted integer array without duplicates, return the summary of its ranges.

Example 1:

Input:  [0,1,2,4,5,7]
Output: ["0->2","4->5","7"]
Explanation: 0,1,2 form a continuous range; 4,5 form a continuous range.
Example 2:

Input:  [0,2,3,4,6,8,9]
Output: ["0","2->4","6","8->9"]
Explanation: 2,3,4 form a continuous range; 8,9 form a continuous range.
```

# solution 

```c++
class Solution {
public:
    vector<string> summaryRanges(vector<int>& nums) {
        vector<string> res;
        
        for (int i=0;i<nums.size();i++) {
            string t = "";
            int v = nums[i];
            t += to_string(v);
            int start = v;
            int j = i+1;
            for (;j<nums.size() && nums[j] == 1+v;j++) {
                v = nums[j];
            }
            if (start != v) {
                t += "->";
                t += to_string(v);
            }
            i = j-1;
            res.push_back(t);
        }
        
        return res;
    }
};
//Runtime: 4 ms, faster than 78.98% of C++ online submissions for Summary Ranges.
//Memory Usage: 8.5 MB, less than 64.48% of C++ online submissions for Summary Ranges.
```