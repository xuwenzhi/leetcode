# rectangle-area

[https://leetcode.com/problems/rectangle-area/](https://leetcode.com/problems/rectangle-area/)

```
Find the total area covered by two rectilinear rectangles in a 2D plane.

Each rectangle is defined by its bottom left corner and top right corner as shown in the figure.

Rectangle Area

Example:

Input: A = -3, B = 0, C = 3, D = 4, E = 0, F = -1, G = 9, H = 2
Output: 45
Note:

Assume that the total area is never beyond the maximum possible value of int.
```

# thinking

这个是和长方形是否重叠有关的问题，前置问题应该是这个了[[Easy]rectangle-overlap - 长方形是否重叠](https://github.com/xuwenzhi/leetcode/blob/master/array/rectangle-overlap.md)。

# solution 

直接将overlap的上下左右计算出来，然后再计算。

```c++
class Solution {
public:
    int computeArea(int A, int B, int C, int D, int E, int F, int G, int H) {
        int area1 = (C-A) * (D-B);
        int area2 = (G-E) * (H-F);
        
        int left = max(A, E);
        int right = max(min(C, G), left);
        int bottom = max(F, B);
        int top = max(min(D, H), bottom);
        
        return (long)area1 + area2 - (right-left)*(top-bottom);
    }
};
//Runtime: 16 ms, faster than 65.06% of C++ online submissions for Rectangle Area.
//Memory Usage: 8.1 MB, less than 72.78% of C++ online submissions for Rectangle Area.
```

# solution

这个方案就也很巧妙，首先把两个长方形总面积计算出来，然后再判断是否存在overlap，如果没有overlap直接返回总面积即可，然后再将两个长方形的横坐标搞到一个vector里，纵坐标搞到一个vector里，对两个vector排序，然后计算overlap也是一个很巧妙的方案。

```c++
int computeArea(int A, int B, int C, int D, int E, int F, int G, int H) 
{
    int total = (C-A) * (D-B) + (G-E) * (H-F);
    
    if (C<=E || A>=G || B>=H || D<=F )
        return total;
    else
    {
        vector <int> h;
        h.push_back(A);
        h.push_back(C);
        h.push_back(E);
        h.push_back(G);
   
        vector <int> v;
        v.push_back(B);
        v.push_back(D);
        v.push_back(F);
        v.push_back(H);
    
        sort(h.begin(), h.end());
        sort(v.begin(), v.end());
    
        total = total - (h[2] - h [1]) * (v[2] - v[1]);
        return total;
    }
}
```

# refer

[Just another short way](https://leetcode.com/problems/rectangle-area/discuss/62149/Just-another-short-way)

[My easy c++ solution](https://leetcode.com/problems/rectangle-area/discuss/62164/My-easy-c%2B%2B-solution)