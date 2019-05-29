# subsets-ii

[https://leetcode.com/problems/subsets-ii/](https://leetcode.com/problems/subsets-ii/)

```
Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).

Note: The solution set must not contain duplicate subsets.

Example:

Input: [1,2,2]
Output:
[
  [2],
  [1],
  [1,2,2],
  [2,2],
  [1,2],
  []
]
```
# solution (combinations + hashtable)

和第一版比就是加入了可重复的数字，所以我在第一版的基础上加了个 **hashtable** 用于存储已经存入结果的序列，如果出现重复就不再添加。

```c++
class Solution {
private:
    unordered_map<string,int> m;
public:
    vector<vector<int>> subsetsWithDup(vector<int>& nums) {
        vector<vector<int>> res{{}};
        vector<int> pre;
        
        sort(nums.begin(), nums.end());
        for (int i=1;i<=nums.size();i++) {
            combine(nums, 1, i, pre, res);
        }
        
        return res;
    }
    
    string key(vector<int> pre) {
        string s = "";
        for (auto i:pre) {
            s += i+'a';
        }
        
        return s;
    }
    
    void combine(vector<int> &nums, int start, int k, vector<int> pre,     vector<vector<int>> &res) {
        if (pre.size() >= k) {
            if (m[key(pre)]) {
                return;
            }
            res.push_back(pre);
            m[key(pre)] = 1;
            return;
        }
        
        for (int i=start;i<=nums.size();i++) {
            pre.push_back(nums[i-1]);
            combine(nums, i+1, k, pre, res);
            pre.pop_back();
        }
    }
};
//Runtime: 16 ms, faster than 27.46% of C++ online submissions for Subsets II.
//Memory Usage: 12.1 MB, less than 15.31% of C++ online submissions for Subsets II.
```

# solution (awesome)

首先对数组进行排序，以便能够在后面的处理中略过重复数字。然后在不断迭代过程中过滤掉重复的数字即可，核心代码为  **if (i > start && nums[i] == nums[i-1]) continue;**

```c++
class Solution {
private:
    unordered_map<string,int> m;
public:
    vector<vector<int>> subsetsWithDup(vector<int>& nums) {
        vector<vector<int>> res{{}};
        vector<int> pre;
        
        sort(nums.begin(), nums.end());
        combine(nums, 0, pre, res);
        
        return res;
    }
    
    void combine(vector<int> &nums, int start, vector<int> pre, vector<vector<int>> &res) {
        for (int i=start;i<nums.size();i++) {
            if (i > start && nums[i] == nums[i-1]) continue;
            pre.push_back(nums[i]);
            res.push_back(pre);
            combine(nums, i+1, pre, res);
            pre.pop_back();
        }
    }
};
```

# refer

[[LeetCode] Subsets I, II](http://bangbingsyb.blogspot.com/2014/11/leetcode-subsets-i-ii.html)