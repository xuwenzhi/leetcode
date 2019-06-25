# flood-fill

[https://leetcode.com/problems/flood-fill/](https://leetcode.com/problems/flood-fill/)

```
An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).

Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.

To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

At the end, return the modified image.

Example 1:

Input: 
image = [[1,1,1],[1,1,0],[1,0,1]]
sr = 1, sc = 1, newColor = 2
Output: [[2,2,2],[2,2,0],[2,0,1]]
Explanation: 
From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected 
by a path of the same color as the starting pixel are colored with the new color.
Note the bottom corner is not colored 2, because it is not 4-directionally connected
to the starting pixel.
Note:

The length of image and image[0] will be in the range [1, 50].
The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
The value of each color in image[i][j] and newColor will be an integer in [0, 65535].
```

# thinking

这个类似于计算岛的那个问题，使用BFS的方式解决，也就是维护一个queue，然后需要注意的是，必须是和目标点元素相等的才进行着色。

# solution 

```c++
class Solution {
public:
    bool isValidPixel(int sr, int sc, int l, int ll) {
        return sr >= 0 && sr < l && sc >= 0 && sc < ll;
    }

    vector<vector<int>> floodFill(vector<vector<int>>& image, int sr, int sc, int newColor) {
        int l = image.size();
        if (!l) return image;
        int ll = image[0].size();
        if (!isValidPixel(sr, sc, l, ll)) return image;
        queue<pair<int,int>> q;
        int start = image[sr][sc];
        if (start == newColor) return image;
        q.push(make_pair(sr, sc));
        
        while (!q.empty()) {
            auto p = q.front();
            q.pop();
            image[p.first][p.second] = newColor;
            if (isValidPixel(p.first-1, p.second, l, ll)
               && image[p.first-1][p.second] == start) 
                q.push(make_pair(p.first-1, p.second));
            if (isValidPixel(p.first, p.second-1, l, ll)
               && image[p.first][p.second-1] == start) 
                q.push(make_pair(p.first, p.second-1));
            if (isValidPixel(p.first, p.second+1, l, ll)
               && image[p.first][p.second+1] == start) 
                q.push(make_pair(p.first, p.second+1));
            if (isValidPixel(p.first+1, p.second, l, ll)
               && image[p.first+1][p.second] == start) 
                q.push(make_pair(p.first+1, p.second));
        }
        
        return image;
    }
};
//Runtime: 24 ms, faster than 89.29% of C++ online submissions for Flood Fill.
//Memory Usage: 10.3 MB, less than 65.62% of C++ online submissions for Flood Fill.
```