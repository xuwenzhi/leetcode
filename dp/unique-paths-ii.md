# unique-paths-ii

[https://leetcode.com/problems/unique-paths-ii/](https://leetcode.com/problems/unique-paths-ii/)

```
A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

Now consider if some obstacles are added to the grids. How many unique paths would there be?

```
![https://assets.leetcode.com/uploads/2018/10/22/robot_maze.png](https://assets.leetcode.com/uploads/2018/10/22/robot_maze.png)
```
An obstacle and empty space is marked as 1 and 0 respectively in the grid.

Note: m and n will be at most 100.

Example 1:

Input:
[
  [0,0,0],
  [0,1,0],
  [0,0,0]
]
Output: 2
Explanation:
There is one obstacle in the middle of the 3x3 grid above.
There are two ways to reach the bottom-right corner:
1. Right -> Right -> Down -> Down
2. Down -> Down -> Right -> Right
```

# thinking

这个和第一版[[Medium]unique-paths](https://github.com/xuwenzhi/leetcode/blob/master/tree/unique-paths.md)是类似的，增加了个路障，所以就是加个判断就可以了。

# solution (bottom to top dynamic programing)

不过这一版的速度不太理想,而且第一次提交没有通过，所以把**vec**的类型改为long了.

```
// O(mn) Runtime, O(mn) Space.
class Solution {
public:
    int uniquePathsWithObstacles(vector<vector<int>>& obstacleGrid) {
        int m = obstacleGrid.size();
        if (m == 0) return 0;
        int n = obstacleGrid[0].size();
        vector<vector<long>> vec(m+1, vector<long>(n+1, 0));
        vec[m-1][n] = 1;
        for (int i=m-1;i>=0;i--) {
            for (int j=n-1;j>=0;j--) {
                vec[i][j] = obstacleGrid[i][j] == 1 ? 0 : vec[i+1][j] + vec[i][j+1];
            }
        }

        return vec[0][0];
    }
};
//Runtime: 12 ms, faster than 11.23% of C++ online submissions for Unique Paths II.
//Memory Usage: 9.3 MB, less than 33.19% of C++ online submissions for Unique Paths II.
```

# solution (top to bottom using 1d array)

```c++
// O(mn) Runtime, O(n) Space.
class Solution {
public:
    int uniquePathsWithObstacles(vector<vector<int>>& obstacleGrid) {
        int m = obstacleGrid.size();
        if (m == 0) return 0;
        int n = obstacleGrid[0].size();

        vector<long> dp(n, 0);
        dp[0] = 1; // 只是设置一个默认值，当出现[0,0]就是1的情况下，后面也会置为0
        for (int i = 0; i < m; ++i) {
            for (int j = 0; j < n; ++j) {
				// pass by order
                if (obstacleGrid[i][j] == 1) dp[j] = 0; // 如果出现路障，则所有经过这个点的路径数量都为0
                else if (j > 0) dp[j] += dp[j-1];
            }
        }

        return dp[n-1];
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Unique Paths II.
//Memory Usage: 9 MB, less than 89.08% of C++ online submissions for Unique Paths II.
```
