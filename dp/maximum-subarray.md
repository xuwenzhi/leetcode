# maximum-subarray

[https://leetcode.com/problems/maximum-subarray/](https://leetcode.com/problems/maximum-subarray/)

```
Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

Example:

Input: [-2,1,-3,4,-1,2,1,-5,4],
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
Follow up:

If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
```

# solution

这个解法实际上是[最大子数列问题-Kadane's algorithm](https://zh.wikipedia.org/wiki/%E6%9C%80%E5%A4%A7%E5%AD%90%E6%95%B0%E5%88%97%E9%97%AE%E9%A2%98)

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        int n = nums.size();
        int ans=nums[0],i,sum=0;
        for(i=0; i<n; i++){
            sum += nums[i];
            ans = max(sum, ans);
            sum = max(0, sum); // 要在这里进行max化，如果case为[-1],会输出0
        }
        return ans;
    }
};
//Runtime: 8 ms, faster than 99.27% of C++ online submissions for Maximum Subarray.
//Memory Usage: 9.2 MB, less than 99.75% of C++ online submissions for Maximum Subarray.
```

# rethinking

使用动态规划的方式解决.
本题的状态转移方程为
```
if (dp[i-1] > 0) {
	dp[i] = nums[i] + dp[i-1];
} else {
	dp[i] = nums[i];
}
```

This problem's importance is : f(k) = max(f(k-1) + A[k], A[k])


# solution (iteration dp)

```c++
class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        vector<int> dp(nums.size(), 0);

        int res = nums[0];
        dp[0] = nums[0];
        for (int i=1; i < nums.size(); i++) {
            if (dp[i-1] > 0) {
                dp[i] = nums[i] + dp[i-1];
            } else {
                dp[i] = nums[i];
            }
        }

        return *max_element(dp.begin(), dp.end());
    }
};
//Runtime: 8 ms, faster than 99.27% of C++ online submissions for Maximum Subarray.
//Memory Usage: 9.5 MB, less than 98.90% of C++ online submissions for Maximum Subarray.
```


# solution (recursion dp)

```c++
// O(n) Runtime, O(n) Space.
class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        int size = nums.size();
        if (size == 0) return 0;
        int res = nums[0];
        maxSubArray(nums, size-1, res);

        return res;
    }

    int maxSubArray(vector<int>& nums, int current, int &res) {
        if (current == 0) return nums[current];

        int sum = maxSubArray(nums, current-1, res);
        if (sum < 0) {
            res = max(res, nums[current]);
            return nums[current];
        }

        sum += nums[current];
        res = max(res, sum);

        return sum;
    }
};
//Runtime: 8 ms, faster than 99.27% of C++ online submissions for Maximum Subarray.
//Memory Usage: 11.9 MB, less than 5.15% of C++ online submissions for Maximum Subarray.
```
