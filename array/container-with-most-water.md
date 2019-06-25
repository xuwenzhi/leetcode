# container-with-most-water

[https://leetcode.com/problems/container-with-most-water/](https://leetcode.com/problems/container-with-most-water/)

```
Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container and n is at least 2.

```
![https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg)
```

The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

 

Example:

Input: [1,8,6,2,5,4,8,3,7]
Output: 49
```

# solution (2 pointer)

采用2 pointer的方式来做，左右两个指针 i j，当height[i] <= height[j] 时，i++，因为右边的柱子最高。反之 j--。

```c++
class Solution {
public:
    int maxArea(vector<int>& height) {
        int l = height.size();
        int i=0, j=l-1;
        int res = 0;
        while (i < j) {
            res = max(res, min(height[i], height[j]) * (j-i));
            if (height[i] <= height[j]) {
                i++;
                continue;
            } else {
                j--;
                continue;
            }
        }
        
        return res;
    }
};
//Runtime: 16 ms, faster than 97.62% of C++ online submissions for Container With Most Water.
//Memory Usage: 9.7 MB, less than 78.67% of C++ online submissions for Container With Most Water.
```