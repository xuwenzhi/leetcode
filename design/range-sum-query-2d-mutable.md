# range-sum-query-2d-mutable

[https://leetcode.com/problems/range-sum-query-2d-mutable/](https://leetcode.com/problems/range-sum-query-2d-mutable/)


```
Given a 2D matrix matrix, find the sum of the elements inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).

Range Sum Query 2D
The above rectangle (with the red border) is defined by (row1, col1) = (2, 1) and (row2, col2) = (4, 3), which contains sum = 8.

Example:

Given matrix = [
  [3, 0, 1, 4, 2],
  [5, 6, 3, 2, 1],
  [1, 2, 0, 1, 5],
  [4, 1, 0, 1, 7],
  [1, 0, 3, 0, 5]
]

sumRegion(2, 1, 4, 3) -> 8
update(3, 2, 2)
sumRegion(2, 1, 4, 3) -> 10
Note:

The matrix is only modifiable by the update function.
You may assume the number of calls to update and sumRegion function is distributed evenly.
You may assume that row1 ≤ row2 and col1 ≤ col2.
```

# thinking

这个题是[[Medium]range-sum-query-mutable - 可变数组和区间](https://github.com/xuwenzhi/leetcode/blob/master/design/range-sum-query-mutable.md)的2D版，所以我的实现方案也是按照分组来搞定，具体实现方案可以看1D版。

# solution (group)

```c++
#define interval 50;
class NumMatrix {
private:
    vector<vector<vector<int>>> v;
    vector<vector<int>> presum;
public:
    NumMatrix(vector<vector<int>>& matrix) {
        for (int i=0;i<matrix.size();i++) {
            v.push_back({});
            presum.push_back({});
            for (int j=0;j<matrix[i].size();j++) {
                int refract = j / interval;
                int jj = j % interval;
                if (jj == 0) v[i].push_back({});
                if (presum[i].size() <= refract) presum[i].push_back(0);
                v[i][refract].push_back(matrix[i][j]);
                presum[i][refract] += matrix[i][j];
            }
        }
    }
    
    
    void update(int row, int col, int val) {
        int refract = col / interval;
        int jj = col % interval;
        presum[row][refract] += 
            val - v[row][refract][jj];
        v[row][refract][jj] = val;
    }
    
    int sumRegion(int row1, int col1, int row2, int col2) {
        int res = 0;
        for (int i=row1; i<= row2; i++) {
            int ii = col1/interval;
            int jj = col2/interval;
            int posi = col1 % interval;
            int posj = col2 % interval;
            if (ii == jj) {
                res += accumulate(v[i][ii].begin()+posi, v[i][ii].begin()+posj+1, 0);
                continue;
            }
            
            int tmp = accumulate(presum[i].begin()+ii, presum[i].begin()+jj+1, 0);
            res += tmp 
                - accumulate(v[i][ii].begin(), 
                             v[i][ii].begin()+posi, 
                             0) 
                - accumulate(v[i][jj].begin()+posj+1,
                            v[i][jj].end(), 
                             0);
        }
        
        return res;
    }
};

/**
 * Your NumMatrix object will be instantiated and called as such:
 * NumMatrix* obj = new NumMatrix(matrix);
 * obj->update(row,col,val);
 * int param_2 = obj->sumRegion(row1,col1,row2,col2);
 */
//Runtime: 24 ms, faster than 45.87% of C++ online submissions for Range Sum Query 2D - Mutable.
//Memory Usage: 14.9 MB, less than 15.98% of C++ online submissions for Range Sum Query 2D - Mutable.
```