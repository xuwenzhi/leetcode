# maximum-size-subarray-sum-equals-k

[https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/](https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/)

```
Given an array nums and a target value k, find the maximum length of a subarray that sums to k. If there isn't one, return 0 instead.

Note:
The sum of the entire nums array is guaranteed to fit within the 32-bit signed integer range.

Example 1:

Input: nums = [1, -1, 5, -2, 3], k = 3
Output: 4 
Explanation: The subarray [1, -1, 5, -2] sums to 3 and is the longest.
Example 2:

Input: nums = [-2, -1, 2, 1], k = 1
Output: 2 
Explanation: The subarray [-1, 2] sums to 1 and is the longest.
Follow Up:
Can you do it in O(n) time?
```

# thinking

和[subarray-sum-equals-k](https://github.com/xuwenzhi/leetcode/blob/master/array/subarray-sum-equals-k.md)是一类题，只不过这个题是求一个最大长度，所以需要在hash中存储的就是下标了，存储下标还有个很重要的事，就是如果之前已经存储了presum的key，那么不能覆盖，要不然找到的结果就不是最长的了。

# solution (presum + hashtable)

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int maxSubArrayLen(vector<int>& nums, int k) {
        int res = 0;
        unordered_map<int, int> m{};
        int presum = 0;

        for (int i=0;i<nums.size();i++) {
            presum += nums[i];
            
            if (presum == k) 
                res = i+1;
            else if (m.count(presum-k)) 
                res = max(res, i-m[presum-k]);
            
            if (!m.count(presum)) 
                m[presum] = i;
        }

        return res;
    }
};
//Runtime: 36 ms, faster than 93.54% of C++ online submissions for Maximum Size Subarray Sum Equals k.
//Memory Usage: 13.9 MB, less than 26.77% of C++ online submissions for Maximum Size Subarray Sum Equals k.
```