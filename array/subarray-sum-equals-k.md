# subarray-sum-equals-k

[https://leetcode.com/problems/subarray-sum-equals-k/](https://leetcode.com/problems/subarray-sum-equals-k/)

```
Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.

Example 1:

Input:nums = [1,1,1], k = 2
Output: 2
Note:

The length of the array is in range [1, 20,000].
The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
```

# solution (brute)

```c++
// O(n^2) Runtime, O(1) Space.
class Solution {
public:
    int subarraySum(vector<int>& nums, int k) {
        int res = 0;
        for (int i=0;i<nums.size();i++) {
            int tmp = 0;
            for (int j=i;j<nums.size();j++) {
                tmp += nums[j];
                if (tmp == k) {
                    res++;
                }
            }
        }

        return res;
    }
};
//Runtime: 480 ms, faster than 22.85% of C++ online submissions for Subarray Sum Equals K.
//Memory Usage: 10.1 MB, less than 100.00% of C++ online submissions for Subarray Sum Equals K.
```

# solution (prefix sum)

![https://github.com/xuwenzhi/leetcode/raw/master/images/subarray-sum-equals-k.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/subarray-sum-equals-k.jpg)

hashtable存储的内容为:

key: prefix_sum

value:当前prefix_sum存在能组合为k的次数

而代码中，为什么要设置 **m[0] = 1**，当存在prefix_sum[i] == k时，也就是当前的这个位置是一个目标结果，而此时会计算 **res += m[presum-k]**，所以得到1.

> 当sum刚好为k的时候，那么数组从起始到当前位置的这段子数组的和就是k，满足题意，如果哈希表中事先没有m[0]项的话，这个符合题意的结果就无法累加到结果res中，这就是初始化的用途。

```c++
// O(n) Runtime, O(n) Space.
class Solution {
public:
    int subarraySum(vector<int>& nums, int k) {
        int res = 0;
        unordered_map<int, int> m{};
        int presum = 0;

        m[0] = 1;
        for (int i=0;i<nums.size();i++) {
            presum += nums[i];
            res += m[presum - k];
            m[presum]++;
        }

        return res;
    }
};
//Runtime: 36 ms, faster than 96.96% of C++ online submissions for Subarray Sum Equals K.
//Memory Usage: 18.2 MB, less than 24.93% of C++ online submissions for Subarray Sum Equals K.
```


# refer

[Google, Facebook面试题解析 | Subarray Sum Equals K](https://zhuanlan.zhihu.com/p/36439368)

[[LeetCode] Subarray Sum Equals K 子数组和为K](https://www.cnblogs.com/grandyang/p/6810361.html)
