# spiral-matrix-ii

[https://leetcode.com/problems/spiral-matrix-ii/](https://leetcode.com/problems/spiral-matrix-ii/)

```
Given a positive integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.

Example:

Input: 3
Output:
[
 [ 1, 2, 3 ],
 [ 8, 9, 4 ],
 [ 7, 6, 5 ]
]
```

# thinking

和[[Medium]spiral-matrix](https://github.com/xuwenzhi/leetcode/blob/master/array/spiral-matrix.md)一个思路。

# solution

```
// O(n) Runtime, O(1) Space.
class Solution {
public:
    vector<vector<int>> generateMatrix(int n) {
        if (n < 0) return vector<vector<int>>{};
        vector<vector<int>> res(n, vector<int>(n, 0));
        int times = 1, outer = 0;
        while (times <= n*n) {
            int i = outer, j = outer;
            for (;j<=n-1-outer;j++) {
                res[i][j] = times++;
            }

            for (int i=outer+1,j=n-1-outer;i<=n-1-outer;i++) {
                res[i][j] = times++;
            }

            for (int i=n-1-outer, j=n-2-outer; j>=outer;j--) {
                res[i][j] = times++;
            }

            for (int i=n-2-outer,j=outer;i>outer;i--) {
                res[i][j] = times++;
            }
            outer++;
        }
        return res;
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Spiral Matrix II.
//Memory Usage: 8.9 MB, less than 93.38% of C++ online submissions for Spiral Matrix II.
```
