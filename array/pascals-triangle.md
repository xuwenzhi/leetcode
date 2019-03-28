# pascals-triangle [easy]

[https://leetcode.com/problems/pascals-triangle/](https://leetcode.com/problems/pascals-triangle/)

```
Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.


![https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif](https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif)
In Pascal's triangle, each number is the sum of the two numbers directly above it.

Example:

Input: 5
Output:
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
```

# solution

```
class Solution {
public:
    vector<vector<int>> generate(int numRows) {
        vector<std::vector<int>> vec{};
        if (numRows <= 0) return vec;
        vec.push_back({1});
        vector<int> tmp{1};
        for (int i = 0; i < numRows - 1; i++) {
            tmp = {1};
            for (int j = 0; j < vec[i].size() - 1; j++) {
                tmp.push_back(vec[i][j] + vec[i][j+1]);
            }
            tmp.push_back(1);
            vec.push_back(tmp);
        }
        return vec;
    }
};
```
Runtime: 4 ms, faster than 100.00% of C++ online submissions for Pascal's Triangle.

Memory Usage: 8.8 MB, less than 36.52% of C++ online submissions for Pascal's Triangle.
