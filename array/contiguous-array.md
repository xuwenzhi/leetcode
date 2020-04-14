# contiguous-array

[https://leetcode.com/problems/contiguous-array/](https://leetcode.com/problems/contiguous-array/)

```
Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.

Example 1:

Input: [0,1]
Output: 2
Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
Example 2:

Input: [0,1,0]
Output: 2
Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
Note: The length of the given binary array will not exceed 50,000.
```

# thinking

这个很像 **subarray** 等类似的题目，可以类似于像 **presum** 类似的解法，和这俩题很类似了 : [[Medium]binary-subarrays-with-sum - 子数组和为K的数量](https://github.com/xuwenzhi/leetcode/blob/master/array/binary-subarrays-with-sum.md)
和
[[Medium]maximum-size-subarray-sum-equals-k - 子数组和为K的长度](https://github.com/xuwenzhi/leetcode/blob/master/array/maximum-size-subarray-sum-equals-k.md)。

# solution

```c++
class Solution {
public:
    int findMaxLength(vector<int>& nums) {
        int res = 0, sum = 0;
        unordered_map<int,int> m;
        m[0] = -1;
        for (int i=0;i<nums.size(); i++) {
            sum += nums[i] == 0 ? -1 : 1;
            if (m.find(sum) != m.end()) {
                res = max(res, i - m[sum]);
            } else {
                m[sum] = i;
            }
        }

        return res;
    }
};
//Runtime: 164 ms, faster than 48.08% of C++ online submissions for Contiguous Array.
//Memory Usage: 17.9 MB, less than 100.00% of C++ online submissions for Contiguous Array.
```
