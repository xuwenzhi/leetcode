# max-area-of-island

[https://leetcode.com/problems/max-area-of-island/](https://leetcode.com/problems/max-area-of-island/)

```
Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)

Example 1:

[[0,0,1,0,0,0,0,1,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,1,1,0,1,0,0,0,0,0,0,0,0],
 [0,1,0,0,1,1,0,0,1,0,1,0,0],
 [0,1,0,0,1,1,0,0,1,1,1,0,0],
 [0,0,0,0,0,0,0,0,0,0,1,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,0,0,0,0,0,0,1,1,0,0,0,0]]
Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
Example 2:

[[0,0,0,0,0,0,0,0]]
Given the above grid, return 0.
Note: The length of each dimension in the given grid does not exceed 50.
```

# solution (DFS)

```c++
class Solution {
public:
    bool isValidPixel(int i, int j, int l, int ll) {
        return i >= 0 
            && i < l
            && j >= 0 
            && j < ll;
    }
    
    void fill(vector<vector<int>>& grid, int i, int j, int& count) {
        if (!isValidPixel(i, j, grid.size(), grid[0].size())) return;
        
        if (grid[i][j] != 1) return;
        
        grid[i][j] = 2;
        count++;
        fill(grid, i-1, j, count);
        fill(grid, i, j-1, count);
        fill(grid, i+1, j, count);
        fill(grid, i, j+1, count);
    }
    int maxAreaOfIsland(vector<vector<int>>& grid) {
        int res = 0, count = 0;
        for (int i=0;i<grid.size();i++) {
            for (int j=0;j<grid[i].size();j++) {
                if (grid[i][j] != 1) continue;
                count = 0;
                fill(grid, i, j, count);
                res = max(res, count);
            }
        }
        
        return res;
    }
};
//Runtime: 16 ms, faster than 83.80% of C++ online submissions for Max Area of Island.
//Memory Usage: 10.2 MB, less than 93.93% of C++ online submissions for Max Area of Island.
```