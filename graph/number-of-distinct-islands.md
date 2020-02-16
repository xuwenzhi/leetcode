# number-of-distinct-islands

[https://leetcode.com/problems/number-of-distinct-islands/](https://leetcode.com/problems/number-of-distinct-islands/)

```
Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

Count the number of distinct islands. An island is considered to be the same as another if and only if one island can be translated (and not rotated or reflected) to equal the other.

Example 1:

11000
11000
00011
00011
Given the above grid map, return 1.
Example 2:

11011
10000
00001
11011
Given the above grid map, return 3.

Notice that:
11
1
and
 1
 11
 are considered different island shapes, because we do not consider reflection / rotation.
 Note: The length of each dimension in the given grid does not exceed 50.
```

# thinking

这道题和 [[Medium]number-of-islands - 岛的数量](https://github.com/xuwenzhi/leetcode/blob/master/graph/number-of-islands.md) 是一个类型的题，不过在这道题中，我们分辨出不同形状的岛的数量，那么难点就在于 **如何表示岛的形状** 。

1. 最开始我想的是记录每一个坐标，然后挨个比较每一个坐标相较于初始点的偏移量，类似于 [0,0][0,1][1,1] 和 [3,3],[3,4][4, 4] 就是一组相同形状的集合。那么如何安装 **从上到下，从左到右** 的顺序拿到这个坐标集合就需要排个序，从理论上讲就已经很麻烦。

2. 那么同样是偏移量的做法，那么只需要记录移动方向即可搞定了，例如，上:1、左：2、右:3、下:4，那么只需要得到这一串并且存储到 **set** 里就OK了，最后结果就是 set 的size 。

# solution

```c++
class Solution {
public:

    void exploreShape(vector<vector<int>>& grid, int c, int r, int signal, vector<int> &shape) {
        if (c < 0 || c >= grid.size()
            || r < 0 || r >= grid[0].size()
            || !grid[c][r]) {
            return;
        }
        grid[c][r] = 0;
        shape.push_back(signal);
        exploreShape(grid, c-1, r, 1, shape);
        exploreShape(grid, c, r+1, 2, shape);
        exploreShape(grid, c, r-1, 3, shape);
        exploreShape(grid, c+1, r, 4, shape);

        shape.push_back(0);
    }

    int numDistinctIslands(vector<vector<int>>& grid) {
        vector<vector<int>> seen(grid.size(), vector<int>(grid[0].size(), 0));
        vector<int> shape;

        for (int i=0;i<grid.size();i++) {
            for (int j=0;j<grid[0].size();j++) {
                if (grid[i][j] == 1) {
                    exploreShape(grid, i, j, 0, shape);

                    if (!shape.empty()) {
                        this->shapes.insert(shape);
                        shape.clear();
                    }
                }
            }
        }

        return this->shapes.size();
    }
private:
    set<vector<int>> shapes;
};
//Runtime: 28 ms, faster than 86.65% of C++ online submissions for Number of Distinct Islands.
//Memory Usage: 15.5 MB, less than 100.00% of C++ online submissions for Number of Distinct Islands.
```
