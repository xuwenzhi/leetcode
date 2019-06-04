# minimum-size-subarray-sum

[https://leetcode.com/problems/minimum-size-subarray-sum/](https://leetcode.com/problems/minimum-size-subarray-sum/)

```
Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

Example: 

Input: s = 7, nums = [2,3,1,2,4,3]
Output: 2
Explanation: the subarray [4,3] has the minimal length under the problem constraint.
Follow up:
If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n). 
```

# thinking

1. 非负数

2. 存在 sum(nums) < s 的情况

# solution (slide window)

```c++
class Solution {
public:
    int minSubArrayLen(int s, vector<int>& nums) {
        if (s > accumulate(nums.begin(), nums.end(), 0)) return 0;
        int res = INT_MAX;
        int i=0, j=0, l=nums.size();
        int cur = 0;
        for (;i<nums.size();i++) {
            // 往右滑，达到s
            while (cur < s && j<l) {
                cur += nums[j];
                j++;
            }
            // 已经到达最后，但是已经来不及达到s，就直接返回res了
            if (cur < s && j >= l) return res;
            
            res = min(res, j-i);

            cur -= nums[i]; // 起到滑动窗口的作用
        }
        
        return res;
    }
};
//Runtime: 8 ms, faster than 98.61% of C++ online submissions for Minimum Size Subarray Sum.
//Memory Usage: 10.1 MB, less than 24.18% of C++ online submissions for Minimum Size Subarray Sum.
```