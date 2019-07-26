# shortest-path-in-binary-matrix

[https://leetcode.com/problems/shortest-path-in-binary-matrix/](https://leetcode.com/problems/shortest-path-in-binary-matrix/)

```
In an N by N square grid, each cell is either empty (0) or blocked (1).

A clear path from top-left to bottom-right has length k if and only if it is composed of cells C_1, C_2, ..., C_k such that:

Adjacent cells C_i and C_{i+1} are connected 8-directionally (ie., they are different and share an edge or corner)
C_1 is at location (0, 0) (ie. has value grid[0][0])
C_k is at location (N-1, N-1) (ie. has value grid[N-1][N-1])
If C_i is located at (r, c), then grid[r][c] is empty (ie. grid[r][c] == 0).
Return the length of the shortest such clear path from top-left to bottom-right.  If such a path does not exist, return -1.

 

Example 1:

Input: [[0,1],[1,0]]
Output: 2
Example 2:

Input: [[0,0,0],[1,1,0],[1,1,0]]
Output: 4
 

Note:

1 <= grid.length == grid[0].length <= 100
grid[r][c] is 0 or 1
```

# thinking

解决这种路径问题最好使用BFS，而不是DFS，DFS适合解决连通性问题。

# solution

```c++
class Solution {
public:
    bool isInvalid(int i, int j, int l, int ll) {
        return i < 0 || i>=l || j < 0 || j >= ll;
    }
    
    int shortestPathBinaryMatrix(vector<vector<int>>& grid) {
        int l = grid.size(), ll = grid[0].size();
        vector<vector<int>> visited(l, vector<int>(ll));
        queue<pair<int,int>> q;
        if (grid[0][0]) return -1;
        visited[0][0] = 1;
        int res = 0, step = 0;
        q.push({0, 0});
        while (!q.empty()) {
            int queueSize = q.size();
            // 因为是BFS，所以每次遍历每一层
            while (queueSize-- > 0) {
                auto p = q.front();
                q.pop();
                int m = p.first, n = p.second;
                if (m == l-1 && n == ll-1) {
                    return step+1;
                }
                for (auto i = -1; i < 2; ++i)
                    for (auto j = -1; j < 2; ++j)
                        if ((i != 0 || j != 0) && !isInvalid(m+i, n+j, l, ll) && !grid[m+i][n+j] && !visited[m+i][n+j]){
                            q.push({ m + i, n + j });
                            visited[m+i][n+j] = 1;
                        }
            }
            step++;
        }
        
        return -1;
    }
};
//Runtime: 52 ms, faster than 79.65% of C++ online submissions for Shortest Path in Binary Matrix.
//Memory Usage: 15.5 MB, less than 100.00% of C++ online submissions for Shortest Path in Binary Matrix.
```