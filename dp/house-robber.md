# house-robber

[https://leetcode.com/problems/house-robber](https://leetcode.com/problems/house-robber)

```
You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

Example 1:

Input: [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
             Total amount you can rob = 1 + 3 = 4.
Example 2:

Input: [2,7,9,3,1]
Output: 12
Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
             Total amount you can rob = 2 + 9 + 1 = 12.
```

# thinking

需要注意的是，只要不相邻都是可以相加的，本题也是相对来说比较简单的，状态转移方程为:

F(x) = max(F(x-2) + nums[i], F(x-1));

所以，新建一个数组**dp[]**用于存放状态值，设置前两个初始值，需要注意的就是这个**dp[1]**，比如case [2,1,1,2]，由于nums[0] > nums[1]，所以我可以不取nums[1]，而是取nums[0]的值。

```
dp[0] = nums[0];
dp[1] = max(nums[0], nums[1]);
```

# solution

```
// O(n) Runtime, O(n) Space.
class Solution {
public:
    int rob(vector<int>& nums) {
        int size = nums.size();
        if (size <= 1) return size == 0 ? 0 : nums[0];
        vector<int> dp(size);
        dp[0] = nums[0];
        dp[1] = max(nums[0], nums[1]);
        for (int i=2;i<size;i++) {
            dp[i] = max(dp[i-1], dp[i-2] + nums[i]);
        }

        return dp.back();
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for House Robber.
//Memory Usage: 8.4 MB, less than 100.00% of C++ online submissions for House Robber.
```
