# height-checker

[https://leetcode.com/problems/height-checker/](https://leetcode.com/problems/height-checker/)

```
Students are asked to stand in non-decreasing order of heights for an annual photo.

Return the minimum number of students not standing in the right positions.  (This is the number of students that must move in order for all students to be standing in non-decreasing order of height.)

 

Example 1:

Input: [1,1,4,2,1,3]
Output: 3
Explanation: 
Students with heights 4, 3 and the last 1 are not standing in the right positions.
 

Note:

1 <= heights.length <= 100
1 <= heights[i] <= 100
```

# solution 

排个序，然后比较一下排序后的和原来的就完事了。

```c++
class Solution {
public:
    int heightChecker(vector<int>& heights) {
        int res = 0;
        vector<int> h = heights;
        sort(h.begin(), h.end());
        
        for (int i=0;i<heights.size();i++) {
            if (heights[i] != h[i]) {
                res++;
            }
        }
        
        return res;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Height Checker.
//Memory Usage: 8.8 MB, less than 100.00% of C++ online submissions for Height Checker.
```