# battleships-in-a-board

[https://leetcode.com/problems/battleships-in-a-board/](https://leetcode.com/problems/battleships-in-a-board/)

```
Given an 2D board, count how many battleships are in it. The battleships are represented with 'X's, empty slots are represented with '.'s. You may assume the following rules:
You receive a valid board, made of only battleships or empty slots.
Battleships can only be placed horizontally or vertically. In other words, they can only be made of the shape 1xN (1 row, N columns) or Nx1 (N rows, 1 column), where N can be of any size.
At least one horizontal or vertical cell separates between two battleships - there are no adjacent battleships.
Example:

X..X
...X
...X
In the above board there are 2 battleships.
Invalid Example:

...X
XXXX
...X
This is an invalid board that you will not receive - as battleships will always have a cell separating between them.
Follow up:
Could you do it in one-pass, using only O(1) extra memory and without modifying the value of the board?
```

# solution

只计算 **左上角** 的数量就完事了。

```c++
class Solution {
public:
    int countBattleships(vector<vector<char>>& board) {
        int res = 0;
        for (int i=0;i<board.size();i++) {
            for (int j=0;j<board[0].size();j++) {
                if (board[i][j] == '.') continue;
                if (i > 0 && board[i-1][j] == 'X') continue;
                if (j > 0 && board[i][j-1] == 'X') continue;
                res++;
            }
        }

        return res;
    }
};
//Runtime: 8 ms, faster than 70.00% of C++ online submissions for Battleships in a Board.
//Memory Usage: 8.6 MB, less than 100.00% of C++ online submissions for Battleships in a Board.
```


# refer

[Simple Java Solution](https://leetcode.com/problems/battleships-in-a-board/discuss/90902/Simple-Java-Solution)
