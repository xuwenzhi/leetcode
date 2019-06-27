# longest-increasing-subsequence

[https://leetcode.com/problems/longest-increasing-subsequence/](https://leetcode.com/problems/longest-increasing-subsequence/)

```
Given an unsorted array of integers, find the length of longest increasing subsequence.

Example:

Input: [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
Note:

There may be more than one LIS combination, it is only necessary for you to return the length.
Your algorithm should run in O(n2) complexity.
Follow up: Could you improve it to O(n log n) time complexity?
```

# solution (dynamic programing)

核心代码就是，使用dp记录到达当前位置的最长递增子序列的长度.

```
if (nums[i] > nums[j]) {
	dp[i] = max(dp[i], dp[j] + 1);
}
```

```c++
// O(n^2) Runtime, O(n) Space.
class Solution {
public:
    int lengthOfLIS(vector<int>& nums) {
        int l = nums.size();
        int res = 0;
        vector<int> dp(l, 1);
        for (int i=0;i<l;i++) {
            for (int j=0;j<i;j++) {
                if (nums[i] > nums[j]) {
                    dp[i] = max(dp[i], dp[j] + 1);
                }
            }

            res = max(res, dp[i]);
        }

        return res;
    }
};
//Runtime: 44 ms, faster than 42.99% of C++ online submissions for Longest Increasing Subsequence.
//Memory Usage: 8.8 MB, less than 13.95% of C++ online submissions for Longest Increasing Subsequence.
```

# solution (2 pointer)

这个方案是论坛中或者其他解决LIS比较推崇的方法，使用一个额外数组**t**来保存中间状态，但并不保存目标LIS，也就是我们最终返回只是返回 **t.size()** 仅此而已，至于这个算法的工作流程可以看如下示例

[1,3,6,7,9,4,10,5,6]

[1]

[1,3]

[1,3,6]

[1,3,6,7]

[1,3,6,7,9]

[1,3,4,7,9]

[1,3,4,7,9,10]

[1,3,4,5,9,10]

[1,3,4,5,6,10]

> If X > last element in S, then parent[indexX] = indexLastElement. This means the parent of the newest element is the last element. We just prepend X to the end of S. Otherwise find the index of the smallest element in S, which is >= than X, and change it to X. Here parent[indexX] = S[index - 1].

```c++
// O(nLogn) Runtime, O(n) Space.
class Solution {
public:
    int lengthOfLIS(vector<int>& nums) {
        vector<int> t;

        for (int i=0;i<nums.size();i++) {
            if (t.empty()) {
                t.push_back(nums[i]);
            } else {
                if (nums[i] > t.back()) {
                    t.push_back(nums[i]);
                } else {
                    std::vector<int>::iterator pos = lower_bound(t.begin(), t.end(), nums[i]);
                    t[pos-t.begin()] = nums[i];
                }
            }
        }
        return t.size();
    }
};
```

# points

- [lower_bound() -  The C++ inner function for binary search.](http://www.cplusplus.com/reference/algorithm/lower_bound/)

# refer

- [How to determine the longest increasing subsequence using dynamic programming?](https://stackoverflow.com/questions/2631726/how-to-determine-the-longest-increasing-subsequence-using-dynamic-programming)

- [[LeetCode] Longest Increasing Subsequence 最长递增子序列](http://www.cnblogs.com/grandyang/p/4938187.html)
