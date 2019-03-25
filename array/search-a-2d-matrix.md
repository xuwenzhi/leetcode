# search-a-2d-matrix

[https://leetcode.com/problems/search-a-2d-matrix/](https://leetcode.com/problems/search-a-2d-matrix/)

```
Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

Integers in each row are sorted from left to right.
The first integer of each row is greater than the last integer of the previous row.
Example 1:

Input:
matrix = [
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
target = 3
Output: true
Example 2:

Input:
matrix = [
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
target = 13
Output: false
```

# thinking

1. 这是一个二维版的**二分查找**问题

# solution

```
class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int row_size = matrix.size();
        int col_size = row_size > 0 ? matrix[0].size() : 0;
        int high = row_size * col_size, low = 0;
        int mid_row, mid_col;
        while (low < high) {
            mid_row = (low + (high - low) / 2) / col_size;
            mid_col = (low + (high - low) / 2) % col_size;

            if (matrix[mid_row][mid_col] == target) {
                return true;
            } else if (matrix[mid_row][mid_col] < target) {
                low = mid_row * col_size + mid_col + 1;
            } else {
                cout<<mid_row<<":"<<mid_col<<endl;
                high = mid_row * col_size + mid_col;
            }
        }

        return false;
    }
};
```

Success

Details

Runtime: 12 ms, faster than 98.62% of C++ online submissions for Search a 2D Matrix.

Memory Usage: 10.4 MB, less than 98.43% of C++ online submissions for Search a 2D Matrix.
