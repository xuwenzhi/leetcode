# the-maze

[https://leetcode.com/problems/the-maze/](https://leetcode.com/problems/the-maze/)

```
There is a ball in a maze with empty spaces and walls. The ball can go through empty spaces by rolling up, down, left or right, but it won't stop rolling until hitting a wall. When the ball stops, it could choose the next direction.

Given the ball's start position, the destination and the maze, determine whether the ball could stop at the destination.

The maze is represented by a binary 2D array. 1 means the wall and 0 means the empty space. You may assume that the borders of the maze are all walls. The start and destination coordinates are represented by row and column indexes.



Example 1:

Input 1: a maze represented by a 2D array

0 0 1 0 0
0 0 0 0 0
0 0 0 1 0
1 1 0 1 1
0 0 0 0 0

Input 2: start coordinate (rowStart, colStart) = (0, 4)
Input 3: destination coordinate (rowDest, colDest) = (4, 4)

Output: true

```
![https://assets.leetcode.com/uploads/2018/10/12/maze_1_example_1.png](https://assets.leetcode.com/uploads/2018/10/12/maze_1_example_1.png)
```

Explanation: One possible way is : left -> down -> left -> down -> right -> down -> right.

Example 2:

Input 1: a maze represented by a 2D array

0 0 1 0 0
0 0 0 0 0
0 0 0 1 0
1 1 0 1 1
0 0 0 0 0

Input 2: start coordinate (rowStart, colStart) = (0, 4)
Input 3: destination coordinate (rowDest, colDest) = (3, 2)

Output: false

Explanation: There is no way for the ball to stop at the destination.
```
![https://assets.leetcode.com/uploads/2018/10/13/maze_1_example_2.png](https://assets.leetcode.com/uploads/2018/10/13/maze_1_example_2.png)
```


Note:

There is only one ball and one destination in the maze.
Both the ball and the destination exist on an empty space, and they will not be at the same position initially.
The given maze does not contain border (like the red rectangle in the example pictures), but you could assume the border of the maze are all walls.
The maze contains at least 2 empty spaces, and both the width and height of the maze won't exceed 100.
```

# thinking

这个就是判断图连通性的问题，直接 **DFS** 搞定即可。

# solution

```c++
class Solution {
public:

    void pass(vector<vector<int>>& maze, int col, int row, bool& res) {
        string pos = to_string(col) + "-" + to_string(row);
        if (res || col < 0 || col >= maze.size() || row < 0 || row >= maze[0].size() || this->path[pos]) {
            return;
        }

        this->path[pos] = true;
        if (col == this->destination[0]
            && row == this->destination[1]) {
            res = true;
            return;
        }

        int c = col, r = row;
        while (c > 0 && 0 == maze[c-1][r]) c--;
        if (c != col)
            pass(maze, c, r, res); // up

        c = col; r = row;
        while (c < maze.size()-1
               && 0 == maze[c+1][r]) c++;
        if (c != col)
            pass(maze, c, r, res); //down

        c = col; r = row;
        while (r > 0 && 0 == maze[c][r-1]) r--;
        if (r != row)
            pass(maze, c, r, res); // left

        c = col; r = row;
        while (r < maze[0].size()-1
               && maze[c][r+1] == 0) r++;
        if (r != row)
          pass(maze, c, r, res); // right
    }

    bool hasPath(vector<vector<int>>& maze, vector<int>& start, vector<int>& destination) {
        if (start[0] == destination[0]
            && start[1] == destination[1])
            return true;

        bool res = false;
        this->destination = destination;
        pass(maze, start[0], start[1], res);

        return res;
    }
private:
    vector<int> destination;
    unordered_map<string, bool> path;
};
//Runtime: 40 ms, faster than 52.83% of C++ online submissions for The Maze.
//Memory Usage: 25.8 MB, less than 50.00% of C++ online submissions for The Maze.
```
