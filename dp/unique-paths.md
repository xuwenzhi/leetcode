# unique-paths

[https://leetcode.com/problems/unique-paths](https://leetcode.com/problems/unique-paths)

```
A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

How many possible unique paths are there?


Above is a 7 x 3 grid. How many possible unique paths are there?

Note: m and n will be at most 100.

Example 1:

Input: m = 3, n = 2
Output: 3
Explanation:
From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Right -> Down
2. Right -> Down -> Right
3. Down -> Right -> Right
Example 2:

Input: m = 7, n = 3
Output: 28
```

# thinking

由于只能从左边或者上边移动到终点，所以状态转移方程为**dp[i][j] = dp[i-1][j] + dp[i][j-1]**。

# solution (top to bottom dynamic programing)

```c++
// O(mn) Runtime, O(mn) Space.
class Solution {
public:
    int uniquePaths(int m, int n) {
        vector<vector<int>> vec(m+1, vector<int>(n+1, 0));
        vec[1][0] = 1;
        for (int i = 1; i <= m; i++) {
            for (int j=1;j<=n;j++) {
                vec[i][j] = vec[i-1][j] + vec[i][j-1];
            }
        }

        return vec[m][n];
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Unique Paths.
//Memory Usage: 8.8 MB, less than 17.95% of C++ online submissions for Unique Paths.
```


# solution (top to bottom, using 1d array)

```
// O(mn) Runtime, O(n) Space.
class Solution {
public:
    int uniquePaths(int m, int n) {
        vector<int> dp(n, 1);
        for (int i = 1; i < m; ++i) {
            for (int j = 1; j < n; ++j) {
				// pass by order
                dp[j] += dp[j - 1];
            }
        }
        return dp[n - 1];
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Unique Paths.
//Memory Usage: 8.3 MB, less than 62.94% of C++ online submissions forUnique Paths.
```

# solution (bottom to top dynamic programing)

```c++
// O(mn) Runtime, O(mn) Space.
class Solution {
public:
    int uniquePaths(int m, int n) {
        vector<vector<int>> vec(m+1, vector<int>(n+1, 0));
        vec[m-1][n] = 1;
        for (int i = m-1; i >= 0; i--) {
            for (int j=n-1; j>=0; j--) {
                vec[i][j] = vec[i+1][j] + vec[i][j+1];
            }
        }

        return vec[0][0];
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Unique Paths.
//Memory Usage: 8.7 MB, less than 28.44% of C++ online submissions for Unique Paths.
```

# solution (backtrack)

<a href="https://www.codecogs.com/eqnedit.php?latex=O(\binom{m&plus;n}{n})&space;Runtime,&space;O(m&plus;n)&space;Space." target="_blank"><img src="https://latex.codecogs.com/gif.latex?O(\binom{m&plus;n}{n})&space;Runtime,&space;O(m&plus;n)&space;Space." title="O(\binom{m+n}{n}) Runtime, O(m+n) Space." /></a>
```
class Solution {
public:
    int uniquePaths(int m, int n) {
        vector<vector<int>> vec(m+1, vector<int>(n+1, -1));
        return backtrack(m, n, 0, 0, vec);
    }

    int backtrack(int m, int n, int i, int j, vector<vector<int>> &vec) {
        if (i == m-1 && j == n-1) return 1;
        if (i >= m || j >= n) return 0;

        if (vec[i+1][j] == -1) {
            vec[i+1][j] = backtrack(m, n, i+1, j, vec);
        }
        if (vec[i][j+1] == -1) {
            vec[i][j+1] = backtrack(m, n, i, j+1, vec);
        }

        return vec[i+1][j] + vec[i][j+1];
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Unique Paths.
//Memory Usage: 8.9 MB, less than 6.76% of C++ online submissions for Unique Paths.
```
