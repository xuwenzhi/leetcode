# range-sum-query-2d-immutable

[https://leetcode.com/problems/range-sum-query-2d-immutable/](https://leetcode.com/problems/range-sum-query-2d-immutable/)

```
Given a 2D matrix matrix, find the sum of the elements inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).

Range Sum Query 2D
The above rectangle (with the red border) is defined by (row1, col1) = (2, 1) and (row2, col2) = (4, 3), which contains sum = 8.

![https://leetcode.com/static/images/courses/range_sum_query_2d.png](https://leetcode.com/static/images/courses/range_sum_query_2d.png)

Example:

Given matrix = [
  [3, 0, 1, 4, 2],
  [5, 6, 3, 2, 1],
  [1, 2, 0, 1, 5],
  [4, 1, 0, 1, 7],
  [1, 0, 3, 0, 5]
]

sumRegion(2, 1, 4, 3) -> 8
sumRegion(1, 1, 2, 2) -> 11
sumRegion(1, 2, 2, 4) -> 12
Note:

You may assume that the matrix does not change.
There are many calls to sumRegion function.
You may assume that row1 ≤ row2 and col1 ≤ col2.
```

# solution (brute force)

意料之中的超时了。

```c++
class NumMatrix {
private:
    vector<vector<int>> v;
public:
    NumMatrix(vector<vector<int>>& matrix) {
        v = matrix;
    }
    
    int sumRegion(int row1, int col1, int row2, int col2) {
        int res = 0;
        for (int i=row1;i<=row2;i++) {
            for (int j=col1;j<=col2;j++) {
                res += v[i][j];
            }
        }
        return res;
    }
};

/**
 * Your NumMatrix object will be instantiated and called as such:
 * NumMatrix* obj = new NumMatrix(matrix);
 * int param_1 = obj->sumRegion(row1,col1,row2,col2);
 */
```

# solution (row col)

这种就是把一维的处理方案扩展到二维，实际上只需要一个二维数组presum即可搞定，数组的每一行记录presum。

在计算时，从row1开始遍历到row2，然后取对应行的presum计算就完事了。

```c++
class NumMatrix {
private:
    vector<vector<int>> h;
public:
    NumMatrix(vector<vector<int>>& matrix) {
        int row = matrix.size();
        int col = row > 0 ? matrix[0].size() : 0;
        for (int i=0;i<row;i++) {
            int n = 0;
            h.push_back({});
            for (int j=0;j<col;j++) {
                n += matrix[i][j];
                h[i].push_back(n);
            }
        }
    }
    
    int sumRegion(int row1, int col1, int row2, int col2) {
        int res = 0;
        
        int row = h.size();
        int col = row > 0 ? h[0].size() : 0;
        
        for (int i=row1;i<=row2;i++) {
            if (col1 == 0) 
                res += h[i][col2];
            else 
                res += h[i][col2] - h[i][col1-1];
        }
        
        return res;
    }
};

/**
 * Your NumMatrix object will be instantiated and called as such:
 * NumMatrix* obj = new NumMatrix(matrix);
 * int param_1 = obj->sumRegion(row1,col1,row2,col2);
 */
```