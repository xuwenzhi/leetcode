# spiral-matrix

[https://leetcode.com/problems/spiral-matrix](https://leetcode.com/problems/spiral-matrix)

```
Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

Example 1:

Input:
[
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]
Output: [1,2,3,6,9,8,7,4,5]
Example 2:

Input:
[
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9,10,11,12]
]
Output: [1,2,3,4,8,12,11,10,9,5,6,7]
```

#thinking


# solution
```
// O(n) Runtime, O(n) Space.
class Solution {
public:
    vector<int> spiralOrder(vector<vector<int>>& matrix) {
        vector<int> res{};
        int outer = 0, m = matrix.size();
        if (m == 0) return res;
        int n = matrix[0].size();
        if (n == 0) return res;
        int sum = 0;
        while(true) {
            int i = outer, j = outer;
            for (;j<=n-1-outer;j++) {
                sum++;
                res.push_back(matrix[i][j]);
            }
            if (sum >= m*n) break;
            for (int i=outer+1,j=n-1-outer;i<=m-1-outer;i++) {
                sum++;
                res.push_back(matrix[i][j]);
            }
            if (sum >= m*n) break;
            for (int i=m-1-outer, j=n-2-outer; j>=outer;j--) {
                res.push_back(matrix[i][j]);
                sum++;
            }
            if (sum >= m*n) break;
            for (int i=m-2-outer,j=outer;i>outer;i--) {
                res.push_back(matrix[i][j]);
                sum++;
            }
            if (sum >= m*n) break;
            outer++;
        }   
        return res;
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Spiral Matrix.
//Memory Usage: 8.7 MB, less than 86.18% of C++ online submissions for Spiral Matrix.
```
