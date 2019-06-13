# island-perimeter

[https://leetcode.com/problems/island-perimeter/](https://leetcode.com/problems/island-perimeter/)

```
You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water.

Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).

The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

 

Example:

Input:
[[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]

Output: 16

Explanation: The perimeter is the 16 yellow stripes in the image below:
```
![https://assets.leetcode.com/uploads/2018/10/12/island.png](https://assets.leetcode.com/uploads/2018/10/12/island.png)

# solution 

这种解法，单纯的一种遍历行为，只需要进行判断即可了。

```c++
class Solution {
public:
    int islandPerimeter(vector<vector<int>>& grid) {
        int l = grid.size();
        int res = 0;
        for (int i=0;i<l;i++) {
            for (int j=0;j<grid[i].size();j++) {
                if (grid[i][j] != 1) continue;
                
                if (j == 0 || grid[i][j-1] == 0) res++;
                if (i == 0 || grid[i-1][j] == 0) res++;
                if (j == grid[i].size()-1 || grid[i][j+1] == 0) res++;
                if (i == l-1 || grid[i+1][j] == 0) res++;
            }
        }
        return res;
    }
};
```

# solution 

还有这种解法，是计算所有的正方形个数，一个正方形有4个边，如果两个正方形相接，则两个正方形同时减去一个边，通过这种思路也可以计算整个岛的周长了。

```c++
int islandPerimeter(vector<vector<int>>& grid) {
    int count=0, repeat=0;
    for(int i=0;i<grid.size();i++)
    {
        for(int j=0; j<grid[i].size();j++)
            {
                if(grid[i][j]==1)
                {
                    count ++;
                    if(i!=0 && grid[i-1][j] == 1) repeat++;
                    if(j!=0 && grid[i][j-1] == 1) repeat++;
                }
            }
    }
    return 4*count-repeat*2;
}
```