# subsets

[https://leetcode.com/problems/subsets/](https://leetcode.com/problems/subsets/)

```
Given a set of distinct integers, nums, return all possible subsets (the power set).

Note: The solution set must not contain duplicate subsets.

Example:

Input: nums = [1,2,3]
Output:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
```

# thinking

这个和 [combinations](https://github.com/xuwenzhi/leetcode/blob/master/array/combinations.md) 如出一辙，只需要简单扩展一下combinations的解答即可。

# solution

```c++
class Solution {
public:
    vector<vector<int>> subsets(vector<int>& nums) {
        vector<vector<int>> res{{}};
        vector<int> pre;
        
        for (int i=1;i<=nums.size();i++) {
            combine(nums, 1, i, pre, res);
        }
        
        
        return res;
    }
    
    void combine(vector<int> &nums, int start, int &k, vector<int> pre, vector<vector<int>> &res) {
        if (pre.size() >= k) {
            res.push_back(pre);
            return;
        }
        
        for (int i=start;i<=nums.size();i++) {
            pre.push_back(nums[i-1]);
            combine(nums, i+1, k, pre, res);
            pre.pop_back();
        }
    }
};
//Runtime: 4 ms, faster than 99.59% of C++ online submissions for Subsets.
//Memory Usage: 9.9 MB, less than 22.49% of C++ online submissions for Subsets.
```
