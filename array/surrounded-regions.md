# surrounded-regions

[https://leetcode.com/problems/surrounded-regions/](https://leetcode.com/problems/surrounded-regions/)

```
Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.

A region is captured by flipping all 'O's into 'X's in that surrounded region.

Example:

X X X X
X O O X
X X O X
X O X X
After running your function, the board should be:

X X X X
X X X X
X X X X
X O X X
Explanation:

Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
```

# solution (DFS)

这种方法是在每次进入fill时，传入res和vector<pair<int,int>>，res用于记录O是否已经到达边缘，而vector<pair<int,int>>用于记录已经遍历过的点，fill在遇到 'O' 时会置为 'A'，并存入vector<pair<int,int>> 函数返回判断 res，如果res已经接触到了边缘，则将A置回 'O'，否则置为 'X'，不过效率不是很高。

```
class Solution {
public:
    bool isValidPixel(int i, int j, int l, int ll) {
        return i >= 0 
            && i < l
            && j >= 0 
            && j < ll;
    }
    
    void fill(vector<vector<char>>& grid, int i, int j, vector<pair<int,int>>& l, bool& res) {
        if (!isValidPixel(i, j, grid.size(), grid[0].size()) || !res) return;
        
        if (grid[i][j] != 'O') return;
        
        if (i == 0 || j == 0 || i == grid.size()-1 || j == grid[0].size()-1) {
            res = false;
            return;
        }
        grid[i][j] = 'A';
        l.push_back(make_pair(i, j));
        fill(grid, i-1, j, l, res);
        fill(grid, i, j-1, l, res);
        fill(grid, i+1, j, l, res);
        fill(grid, i, j+1, l, res);
    }
    void solve(vector<vector<char>>& board) {
        for (int i=0;i<board.size();i++) {
            for (int j=0;j<board[i].size();j++) {
                if (board[i][j] != 'O') continue;
                bool res = true;
                vector<pair<int,int>> v;
                fill(board, i, j, v, res);
                if (res) {
                    for (auto a : v) {
                        board[a.first][a.second] = 'X';
                    }
                } else {
                    for (auto a : v) {
                        board[a.first][a.second] = 'O';
                    }
                }
            }
        }
    }
};
//Runtime: 52 ms, faster than 6.65% of C++ online submissions for Surrounded Regions.
//Memory Usage: 37.6 MB, less than 5.06% of C++ online submissions for Surrounded Regions.
```


# solution (DFS)

这种办法就比较给劲儿了，主要的思路是从周围的 'O' 起步，然后通过DFS把周围一系列的 'O' 改为随意一个字符 比如 '$'，然后最后遍历一遍二维数组，将 'O' -> 'X'，将 '$' -> 'O' 即可了。

```c++
class Solution {
public:
    bool isValidPixel(int i, int j, int l, int ll) {
        return i >= 0 
            && i < l
            && j >= 0 
            && j < ll;
    }
    void fill(vector<vector<char>>& grid, int i, int j) {
        if (!isValidPixel(i, j, grid.size(), grid[0].size()) || grid[i][j] != 'O') return;
        grid[i][j] = '$';
        
        fill(grid, i-1, j);
        fill(grid, i, j-1);
        fill(grid, i+1, j);
        fill(grid, i, j+1);
    }
    void solve(vector<vector<char>>& board) {
        for (int i=0;i<board.size();i++) {
            for (int j=0;j<board[i].size();j++) {
                if ((i == 0 || j == 0 || i == board.size()-1 || j == board[0].size()-1) && board[i][j] == 'O') {
                    fill(board, i, j);
                }
            }
        }

        for (int i=0;i<board.size();i++) {
            for (int j=0;j<board[i].size();j++) {
                if (board[i][j] == 'O') 
                    board[i][j] = 'X';
                if (board[i][j] == '$') 
                    board[i][j] = 'O';
            }
        }
    }
};
//Runtime: 24 ms, faster than 98.71% of C++ online submissions for Surrounded Regions.
//Memory Usage: 14.1 MB, less than 73.63% of C++ online submissions for Surrounded Regions.
```

# refer

[[LeetCode] Surrounded Regions 包围区域](https://www.cnblogs.com/grandyang/p/4555831.html)