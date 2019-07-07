# partition-array-for-maximum-sum

[https://leetcode.com/problems/partition-array-for-maximum-sum/](https://leetcode.com/problems/partition-array-for-maximum-sum/)


```
Given an integer array A, you partition the array into (contiguous) subarrays of length at most K.  After partitioning, each subarray has their values changed to become the maximum value of that subarray.

Return the largest sum of the given array after partitioning.

 

Example 1:

Input: A = [1,15,7,9,2,5,10], K = 3
Output: 84
Explanation: A becomes [15,15,15,9,10,10,10]
 

Note:

1 <= K <= A.length <= 500
0 <= A[i] <= 10^6
```

# thinking

是一个DP类的题目，记得有点像是不是IP地址那道题[restore-ip-addresses](https://github.com/xuwenzhi/leetcode/blob/master/string/restore-ip-addresses.md)，嗯，只不过这里面的3改为了K，所以思路是通用的。而且这道题还给了提示，所以比较简单了。

```
For j = 1 .. k that keeps everything in bounds, dp[i] is the maximum of dp[i-j] + max(A[i-1], ..., A[i-j]) * j .
```

# solution 

```c++
class Solution {
public:
    int maxSumAfterPartitioning(vector<int>& A, int K) {
        int l = A.size();
        vector<int> dp(l+1);
        for (int i=0;i<l;i++) {
            int ma = A[i];
            for (int j=0;j<K && (i-j)>=0;j++) {
                ma = max(ma, A[i-j]);
                dp[i+1] = max(dp[i+1], dp[i-j] + ma*(j+1));
            }
        }
        
        return dp[l];
    }
};
//Runtime: 16 ms, faster than 73.80% of C++ online submissions for Partition Array for Maximum Sum.
//Memory Usage: 8.9 MB, less than 100.00% of C++ online submissions for Partition Array for Maximum Sum.
```