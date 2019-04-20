# house-robber-ii

[https://leetcode.com/problems/house-robber-ii/](https://leetcode.com/problems/house-robber-ii/)

```
You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

Example 1:

Input: [2,3,2]
Output: 3
Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2),
             because they are adjacent houses.
Example 2:

Input: [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
             Total amount you can rob = 1 + 3 = 4.
```

# thinking

打家劫舍的第二版，和第一版相比是首尾成环，所以首和尾不能同时出现，一开始把方法搞复杂了。

一开始是想:
用一个变量来存储有没有用到第一位元素这样的标记位，一次遍历出来，然后到尾部再单独做处理，不过差强人意，所以就放弃了.

后来的解决方案:
仔细一想，对第二版拆解，实际上是比较

max(house-robber(0, len-1), house-robber(1,len));

就好了.

# solution
```c++
// O(n) Runtime, O(n) Runtime.
class Solution {
public:
    int rob(vector<int>& nums) {
        int len = nums.size();
        if (len <= 1) return len == 0 ? 0 : nums[0];
        if (len == 2) return nums[0] > nums[1] ? nums[0] : nums[1];
        int maxOdd = rob(nums, 0, len-1);
        int maxEven = rob(nums, 1, len);

        return max(maxOdd, maxEven);
    }

    int rob(vector<int>&nums, int start, int end) {
        vector<int> dp(end);
        dp[start] = nums[start];
        dp[start+1] = max(nums[start], nums[start+1]);
        for (int i=start+2; i<end;i++) {
            dp[i] = max(dp[i-2] + nums[i], dp[i-1]);
        }
        return dp[end-1];
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for House Robber II.
//Memory Usage: 8.6 MB, less than 100.00% of C++ online submissions for House Robber II.
```
