# word-search

[https://leetcode.com/problems/word-search/](https://leetcode.com/problems/word-search/)

```
Given a 2D board and a word, find if the word exists in the grid.

The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

Example:

board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]

Given word = "ABCCED", return true.
Given word = "SEE", return true.
Given word = "ABCB", return false.
```

# solution (DFS)

```c++
class Solution {
public:
    bool isInvalid(int i, int j, int l, int ll) {
        return i < 0 || j < 0 || i >= l || j >= ll;
    }
    
    void find(vector<vector<char>>& board, vector<int> p, int pos, string word, bool& res) {
        
        int i=p[0], j=p[1];
        
        if (res 
            || isInvalid(i,j,board.size(), board[0].size())) 
            return;
        
        if (board[i][j] != word[pos]) {
            return;
        }
        if (pos == word.size()-1) {
            res = true;
            return;
        }
        board[i][j] = '$';
        if (i>0)
            find(board, {i-1, j}, pos+1, word, res);
        if (i<board.size()-1)
            find(board, {i+1, j}, pos+1, word, res);
        if (j<board[0].size()-1)
            find(board, {i, j+1}, pos+1, word, res);
        if (j>0)
            find(board, {i, j-1}, pos+1, word, res);
        board[i][j] = word[pos];
    }

    bool exist(vector<vector<char>>& board, string word) {
        for (int i=0;i<board.size();i++) {
            for (int j=0;j<board[i].size();j++) {
                if (board[i][j] != word[0]) {
                    continue;
                }
                bool res = false;
                find(board, {i, j}, 0, word, res);
                if (res) 
                    return true;
            }
        }
        
        return false;
    }
};
//Runtime: 624 ms, faster than 5.01% of C++ online submissions for Word Search.
//Memory Usage: 307.7 MB, less than 5.00% of C++ online submissions for Word Search.
```


# solution (optimize DFS)

理论上这个和上面那个解决思路差不多，但是 **性能差距很大** ，该注意的点如下:

1. 传递坐标[i, j]时，上面我采用的vector<int>存储i和j，性能差距特别大，该传递俩数的地方还是传递俩数吧

2. 另外word这个变量，可以定义为 const string& word 。

```c++
class Solution {
public:
    bool find(vector<vector<char>>& board, int i, int j, int pos, const string& word) {
        if (pos == word.size()) 
            return true;
        int m = board.size(), n = board[0].size();
        
        if (i < 0 || j < 0 || i >= m || j >= n) 
            return false;
        
        if (board[i][j] != word[pos]) {
            return false;
        }
        
        board[i][j] = '$';
        int match = find(board, i-1, j, pos+1, word) ||
        find(board, i+1, j, pos+1, word) ||
        find(board, i, j+1, pos+1, word) ||
        find(board, i, j-1, pos+1, word);
        board[i][j] = word[pos];
        
        return match;
    }

    bool exist(vector<vector<char>>& board, string word) {
        for (int i=0;i<board.size();i++) {
            for (int j=0;j<board[i].size();j++) {
                if (board[i][j] != word[0]) {
                    continue;
                }
                if (find(board, i, j, 0, word)) 
                    return true;
            }
        }
        
        return false;
    }
};
//Runtime: 16 ms, faster than 99.08% of C++ online submissions for Word Search.
//Memory Usage: 9.9 MB, less than 97.82% of C++ online submissions for Word Search.
```

# refer

[My DFS + Backtracking C++ solution (16ms)](https://leetcode.com/problems/word-search/discuss/27739/)