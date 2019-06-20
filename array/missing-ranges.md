# missing-ranges

[https://leetcode.com/problems/missing-ranges/](https://leetcode.com/problems/missing-ranges/)

```
Given a sorted integer array nums, where the range of elements are in the inclusive range [lower, upper], return its missing ranges.

Example:

Input: nums = [0, 1, 3, 50, 75], lower = 0 and upper = 99,
Output: ["2", "4->49", "51->74", "76->99"]
```

# solution 

```c++
class Solution {
public:
    vector<string> findMissingRanges(vector<int>& nums, int lower, int upper) {
        vector<string> res;
        int l = nums.size();
        if (l==0) {
            if ((long)upper - lower < 1) {
                res.push_back(to_string(lower));
            } else {
                res.push_back(to_string(lower)+"->"+to_string(upper));
            }
            return res;
        }
        
        if (nums[0] > lower) {
            if ((long)nums[0] - lower == 1) {
                res.push_back(to_string(lower));
            } else {
                res.push_back(to_string(lower) + "->" + to_string(nums[0]-1));
            }
        }
        for (int start=0;start < l-1 && nums[start] < upper;start++) {
            if (nums[start]+1 < nums[start+1]) {
                int left = nums[start]+1;
                int right = nums[start+1]-1;
                if (left == right) {
                    res.push_back(to_string(left));
                } else {
                    res.push_back(to_string(left) + "->" + to_string(right));
                }
            }
        }
        
        if (nums[l-1] < upper) {
            if ((long)upper - nums[l-1] == 1) {
                res.push_back(to_string(upper));
            } else {
                res.push_back(to_string(nums[l-1]+1) + "->" + to_string(upper));
            }
        }
        
        return res;
    }
};
//Runtime: 4 ms, faster than 80.52% of C++ online submissions for Missing Ranges.
//Memory Usage: 8.4 MB, less than 89.52% of C++ online submissions for Missing Ranges.
```