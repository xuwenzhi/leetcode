# minimum-path-sum

[https://leetcode.com/problems/minimum-path-sum/](https://leetcode.com/problems/minimum-path-sum/)

```
Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.

Example:

Input:
[
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
Output: 7
Explanation: Because the path 1→3→1→1→1 minimizes the sum.
```

# thinking

这个题和[[Medium]unique-paths](https://github.com/xuwenzhi/leetcode/blob/master/dp/unique-paths.md)差不多类型的，都是一个二维数组，不过这个是求从左上角到右下角所路过数字的最小值，所以还是使用**dp[][]**来存储中间状态值，而本题的状态转移方程也一样:

```
F(x, y) = max(F(x-1, y), F(x, y-1)) + nums[x];
```

不过需要注意在顶部和左边的情况，即x=0和y=0的情况.

# solution

```c++
//O(mn) Runtime, O(mn) Space.
class Solution {
public:
    int minPathSum(vector<vector<int>>& grid) {
        int m = grid.size();
        if (m == 0) return 0;
        int n = grid[0].size();
        vector<vector<int>> dp(m, vector<int>(n,0));
        int minRes = 0;
        for (int i=0;i<m;i++) {
            for (int j=0;j<n;j++) {
                if (i == 0 && j == 0) {
                    dp[i][j] = grid[i][j];
                } else if (i == 0 && j != 0) {
                    dp[i][j] = dp[i][j-1] + grid[i][j];
                } else if (i != 0 && j == 0) {
                    dp[i][j] = dp[i-1][j] + grid[i][j];
                } else {
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j];
                }
            }
        }

        return dp[m-1][n-1];
    }
};
//Runtime: 12 ms, faster than 98.03% of C++ online submissions for Minimum Path Sum.
//Memory Usage: 10.9 MB, less than 71.70% of C++ online submissions for Minimum Path Sum.
```
