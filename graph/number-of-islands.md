# number-of-islands

[https://leetcode.com/problems/number-of-islands/](https://leetcode.com/problems/number-of-islands/)

```
Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

Example 1:

Input:
11110
11010
11000
00000

Output: 1
Example 2:

Input:
11000
11000
00100
00011

Output: 3
```

# thinking

这个和[[Easy]flood-fill - 填充颜色](https://github.com/xuwenzhi/leetcode/blob/master/array/flood-fill.md)属于一个类型，使用BFS的思路计算出岛的个数即可。

Note:最开始想用Hash来存储已经pass过的点，但是超时了，索性就直接修改grid对应位置的值为任意字符，比如'a'，然后再增加判断就好了。

Note: 这个不论是BFS，还是DFS都能达到我们的要求。

# solution (BFS)

```c++
// O(m*n) Runtime, O(k) Space.
class Solution {
public:    
    bool isValidPixel(int sr, int sc, vector<vector<char>>& grid) {
        return sr >= 0 
            && sr < grid.size() 
            && sc >= 0 
            && sc < grid[0].size()
            && grid[sr][sc] == '1';
    }
    
    int numIslands(vector<vector<char>>& grid) {
        int l = grid.size();
        int res = 0;
        queue<pair<int,int>> q;
        
        for (int i=0;i<l;i++) {
            for (int j=0;j<grid[i].size();j++) {
                if (grid[i][j] == '0' || grid[i][j] == 'a') {
                    continue;
                }
                q.push(make_pair(i, j));
                while (!q.empty()) {
                    auto p = q.front();
                    if (grid[p.first][p.second] == 'a') {
                        q.pop();
                        continue;
                    }
                    q.pop();

                    grid[p.first][p.second] = 'a';
                    if (isValidPixel(p.first-1, p.second, grid)) {
                        q.push(make_pair(p.first-1, p.second));
                    }
                    if (isValidPixel(p.first, p.second-1, grid)) {
                        q.push(make_pair(p.first, p.second-1));
                    }
                    if (isValidPixel(p.first, p.second+1, grid)) {
                        q.push(make_pair(p.first, p.second+1));
                    }
                    if (isValidPixel(p.first+1, p.second, grid)) {
                        q.push(make_pair(p.first+1, p.second));
                    }
                }
                res++;
            }
        }

        return res;
    }
};
//Runtime: 16 ms, faster than 81.67% of C++ online submissions for Number of Islands.
//Memory Usage: 10.9 MB, less than 62.55% of C++ online submissions for Number of Islands.
```


# solution (DFS)

```c++
class Solution {
public:    
    bool isValidPixel(int sr, int sc, int l, int ll) {
        return sr >= 0 
            && sr < l
            && sc >= 0 
            && sc < ll;
    }
    
    void fill(vector<vector<char>>& grid, int i, int j) {
        if (!isValidPixel(i, j, grid.size(), grid[0].size())) return;
        
        if (grid[i][j] != '1') return;
        
        grid[i][j] = 'a';
        fill(grid, i-1, j);
        fill(grid, i, j-1);
        fill(grid, i+1, j);
        fill(grid, i, j+1);
    }
    
    int numIslands(vector<vector<char>>& grid) {
        int l = grid.size();
        int res = 0;
        for (int i=0;i<l;i++) {
            for (int j=0;j<grid[i].size();j++) {
                if (grid[i][j] != '1') continue;
                res++;
                fill(grid, i, j);
            }
        }

        return res;
    }
};
//Runtime: 8 ms, faster than 99.71% of C++ online submissions for Number of Islands.
//Memory Usage: 10.5 MB, less than 99.31% of C++ online submissions for Number of Islands.
```