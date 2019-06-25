# trapping-rain-water

[https://leetcode.com/problems/trapping-rain-water/](https://leetcode.com/problems/trapping-rain-water/)

```
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

```
![https://assets.leetcode.com/uploads/2018/10/22/rainwatertrap.png](https://assets.leetcode.com/uploads/2018/10/22/rainwatertrap.png)
```
The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!

Example:

Input: [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
```

# solution (premax + suffixmax)

之前更多的是使用presum，而这次来了个premax，这种解法会比较好理解一点，以case [0,1,0,2,1,0,1,3,2,1,2,1] 为例，

premax    : {0,0,1,1,2,2,2,2,3,3,3,3}

suffixmax : {3,3,3,3,3,3,3,2,2,2,1,0}

以具体一个点为例，可以拿到这个点左右两边可以形成的坑的深度，也就是 min(premax[i], suffixmax[i])， 那么这个点所能存储的水 即为  min(premax[i], suffixmax[i]) - height[i]了。

```c++
class Solution {
public:
    int trap(vector<int>& height) {
        int res = 0,i=0,l=height.size();
        vector<int> premax(l, 0), suffixmax(l,0);
        int mx = 0;
        for (int i=0;i<l;i++) {
            premax[i] = mx;
            mx = max(mx, height[i]);
        }
        
        mx = 0;
        for (int i=l-1;i>=0;i--) {
            suffixmax[i] = mx;
            mx = max(mx, height[i]);
        }
        
        for (int i=0;i<l;i++) {
            int tmp = min(suffixmax[i], premax[i]);
            res += tmp > height[i] ? tmp-height[i] : 0;
        }
        
        return res;
    }
};
//Runtime: 4 ms, faster than 98.44% of C++ online submissions for Trapping Rain Water.
//Memory Usage: 9.3 MB, less than 39.17% of C++ online submissions for Trapping Rain Water.
```

# solution (stack) 

> 遍历高度，如果此时栈为空，或者当前高度小于等于栈顶高度，则把当前高度的坐标压入栈，注意我们不直接把高度压入栈，而是把坐标压入栈，这样方便我们在后来算水平距离。当我们遇到比栈顶高度大的时候，就说明有可能会有坑存在，可以装雨水。此时我们栈里至少有一个高度，如果只有一个的话，那么不能形成坑，我们直接跳过，如果多余一个的话，那么此时把栈顶元素取出来当作坑，新的栈顶元素就是左边界，当前高度是右边界，只要取二者较小的，减去坑的高度，长度就是右边界坐标减去左边界坐标再减1，二者相乘就是盛水量啦.

这种栈的方案，是按照层来进行计算的，而上面的premax方案是已经知道当前点能存储多少水来计算的。

```c++
class Solution {
public:
    
    int trap(vector<int>& height) {
        int res = 0,i=0;
        stack<int> s;
        
        while (i < height.size()) {
            if (s.empty() || height[i] <= height[s.top()]) {
                s.push(i++);
            } else {
                int k = s.top();s.pop();
                if (s.empty()) continue;
                res += (min(height[i], height[s.top()]) - height[k]) * (i-s.top()-1);
            }
        }
        
        return res;
    }
};
//Runtime: 8 ms, faster than 81.60% of C++ online submissions for Trapping Rain Water.
//Memory Usage: 9.4 MB, less than 34.98% of C++ online submissions for Trapping Rain Water.
```

# refer

[[LeetCode] Trapping Rain Water 收集雨水](https://www.cnblogs.com/grandyang/p/4402392.html)
