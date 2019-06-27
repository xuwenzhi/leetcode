# largest-rectangle-in-histogram

```
Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.

```
![https://assets.leetcode.com/uploads/2018/10/12/histogram.png](https://assets.leetcode.com/uploads/2018/10/12/histogram.png)
```
Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
```
![https://assets.leetcode.com/uploads/2018/10/12/histogram_area.png](https://assets.leetcode.com/uploads/2018/10/12/histogram_area.png)
```

The largest rectangle is shown in the shaded area, which has area = 10 unit.

 

Example:

Input: [2,1,5,6,2,3]
Output: 10
```

# solution (dp)

又仔细的看了下，感觉我这个方案好像还是个brute force呀~其实也不是，实际上这个dp数组实际上是找到当前值前面的最小值，貌似是这个理儿。

```c++
class Solution {
public:
    int largestRectangleArea(vector<int>& heights) {
        int l = heights.size();
        vector<int> dp(l);
        if (l <= 0) return 0;
        
        int res = 0;

        // 这个位置属于是面向case加的，因为有个case全是1，大量的1导致超时。。
        int flag = true, a = heights[0];
        for (int i=0;i<l;i++) {
            if (a != heights[i]) flag = false;
        }
        if (flag) return heights[0] * l;
        
        for (int i=0;i<l;i++) {
            int mn = heights[i];
            for (int j=i;j<l;j++) {
                mn = min(mn, heights[j]);
                dp[j] = mn;
            }
            int tmp = (long)mn * (l-i);
            for (int j=l-1;j>=i;j--) {
                if (dp[j] != mn) {
                    tmp = max(tmp, dp[j] * (j-i+1));
                }
            }
            res = max(res, tmp);
        }
        
        return res;
    }
};
//Runtime: 1160 ms, faster than 5.01% of C++ online submissions for Largest Rectangle in Histogram.
//Memory Usage: 10.1 MB, less than 87.77% of C++ online submissions for Largest Rectangle in Histogram.
```


# solution (monotone stack)

没错，这个使用单调栈解决的，而且是一个单调递增的栈。

关于单调栈，可以简单理解为两点

1. 单调递增栈可以找到左起第一个比当前数字小的元素。

2. 单调递减栈可以找到左起第一个比当前数字大的元素。

```c++
class Solution {
public:
    int largestRectangleArea(vector<int>& heights) {
        int res = 0;
        stack<int> s;
        heights.push_back(0);
        for (int i=0;i<heights.size();i++) {
            while (!s.empty() && heights[s.top()] >= heights[i]) {
                int h = heights[s.top()];
                s.pop();
                int idx = s.empty() ? -1 : s.top();
                
                res = max(res, h * (i - idx - 1));
            }
            s.push(i);
        }
        
        return res;
    }
};
//Runtime: 12 ms, faster than 94.04% of C++ online submissions for Largest Rectangle in Histogram.
//Memory Usage: 10.6 MB, less than 40.26% of C++ online submissions for Largest Rectangle in Histogram.
```

# refer

[浅谈单调栈](https://zhuanlan.zhihu.com/p/26465701)