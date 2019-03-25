# search-a-2d-matrix-ii

[https://leetcode.com/problems/search-a-2d-matrix-ii/](https://leetcode.com/problems/search-a-2d-matrix-ii/)

```
Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

Integers in each row are sorted in ascending from left to right.
Integers in each column are sorted in ascending from top to bottom.
Example:

Consider the following matrix:

[
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]
Given target = 5, return true.

Given target = 20, return false.
```

# thinking

 从矩阵的右上角开始，从右上角不断的往左下角进军，为啥从右上角开始呢？右上角这个位置相对来说比较特殊，这个点，大于同行左边小于同列下边，这里可以说就是二分查找的中间点，嗯!


# solution

```
class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int row_size = matrix.size();
        if (row_size <= 0) return false;

        int col_size = row_size > 0 ? matrix[0].size() : 0;
        int i = 0, j = col_size - 1;
        while (i <= row_size - 1 && j >= 0) {
            if (matrix[i][j] == target) {
                return true;
            } else if (matrix[i][j] < target) {
                i++;
            } else {
                j--;
            }
        }

        return false;
    }
};
```

Success

Details

Runtime: 68 ms, faster than 81.88% of C++ online submissions for Search a 2D Matrix II.

Memory Usage: 12.9 MB, less than 53.96% of C++ online submissions for Search a 2D Matrix II.
