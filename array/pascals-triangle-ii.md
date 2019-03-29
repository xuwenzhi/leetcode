# pascals-triangle-ii

[https://leetcode.com/problems/pascals-triangle-ii/](https://leetcode.com/problems/pascals-triangle-ii/)

```
Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.

Note that the row index starts from 0.
```
![https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif](https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif)
```
In Pascal's triangle, each number is the sum of the two numbers directly above it.

Example:

Input: 3
Output: [1,3,3,1]
Follow up:

Could you optimize your algorithm to use only O(k) extra space?
```

# thinking

由于这个不像[pascals-triangle(easy)](https://github.com/xuwenzhi/leetcode/blob/master/array/pascals-triangle.md)这道题需要返回完成的数组，所以为节省空间，其实只需要维护一个临时一排即可.

# solution

```c++
class Solution {
public:
    vector<int> getRow(int rowIndex) {
        std::vector<int> vec{1}, tmp;
        for (int i = 0; i <= rowIndex - 1; i++) {
            tmp = {1};
            for (int j = 0; j < vec.size() - 1; j++) {
                tmp.push_back(vec[j] + vec[j+1]);
            }
            tmp.push_back(1);
            vec = tmp;
        }
        return vec;
    }
};
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Pascal's Triangle II.

Memory Usage: 8.3 MB, less than 90.05% of C++ online submissions for Pascal's Triangle II.
