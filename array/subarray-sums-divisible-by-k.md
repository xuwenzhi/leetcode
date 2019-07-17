# subarray-sums-divisible-by-k

[https://leetcode.com/problems/subarray-sums-divisible-by-k/](https://leetcode.com/problems/subarray-sums-divisible-by-k/)

```
Given an array A of integers, return the number of (contiguous, non-empty) subarrays that have a sum divisible by K.

 

Example 1:

Input: A = [4,5,0,-2,-3,1], K = 5
Output: 7
Explanation: There are 7 subarrays with a sum divisible by K = 5:
[4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]
 

Note:

1 <= A.length <= 30000
-10000 <= A[i] <= 10000
2 <= K <= 10000

```

# thinking

这个比较类似[[Medium]subarray-sum-equals-k - 子数组和为K的数量](https://github.com/xuwenzhi/leetcode/blob/master/array/subarray-sum-equals-k.md)，是一道 **presum** 的问题，需要注意的点是.


Note:

1. 是子数组之和是否可以整除 K ，并不是子数组的积

# solution 

```c++
class Solution {
public:
    int subarraysDivByK(vector<int>& A, int K) {
        int res = 0;
        unordered_map<int, int> m{};
        int presum = 0;
        m[0] = 1;
        for (int i=0;i<A.size();i++) {
            presum = (presum + A[i]) % K;
            if (presum < 0)
                presum += K; // -1 % 5 = -1, but we need remain presum is positive
            res += m[presum]++;
        }
        
        return res;
    }
};
//Runtime: 68 ms, faster than 51.17% of C++ online submissions for Subarray Sums Divisible by K.
//Memory Usage: 13.8 MB, less than 49.43% of C++ online submissions for Subarray Sums Divisible by K.
```