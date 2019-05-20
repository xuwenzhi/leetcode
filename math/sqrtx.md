# sqrtx

[https://leetcode.com/problems/sqrtx/](https://leetcode.com/problems/sqrtx/)

```
Implement int sqrt(int x).

Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.

Example 1:

Input: 4
Output: 2
Example 2:

Input: 8
Output: 2
Explanation: The square root of 8 is 2.82842..., and since
             the decimal part is truncated, 2 is returned.
```

# solution

一种从0开始依次遍历的方法.

```c++
class Solution {
public:
    int mySqrt(int x) {
        if (x == 0) return 0;
        int n = 0;
        while ((long)(n+1)*(n+1) <= x) {
            n++;
        }

        return n;
    }
};
//Runtime: 28 ms, faster than 14.64% of C++ online submissions for Sqrt(x).
//Memory Usage: 8.4 MB, less than 58.30% of C++ online submissions for Sqrt(x).
```

# solution (binary search)

```c++
class Solution {
public:
    int mySqrt(int x) {
        if (x <= 1) return x;
        int low = 0, high = x;
        while (low < high-1) {
            int mid = low + (high - low) / 2;
            if ((long)mid * mid == x) {
                return mid;
            } else if ((long)mid * mid < x) {
                low = mid;
            } else {
                high = mid;
            }
        }

        return high-1;
    }
};
//Runtime: 4 ms, faster than 97.53% of C++ online submissions for Sqrt(x).
//Memory Usage: 8.4 MB, less than 57.84% of C++ online submissions for Sqrt(x).
```

# solution (Newton's Method)

```c++
class Solution {
public:
    int mySqrt(int x) {
        if (x <= 1) return x;
        long res = x;
        while (res * res > x) {
            res = (res + x / res) / 2;
        }

        return res;
    }
};
```

# Newton's Method

1. 前提或通用公式

![https://2-im.guokr.com/formula/aefc36d26e2b81c7381b838b5cbc1f3c5dad173a.svg](https://2-im.guokr.com/formula/aefc36d26e2b81c7381b838b5cbc1f3c5dad173a.svg)

2. 简化公式

代入实际场景，简化公式

![https://3-im.guokr.com/formula/1848f3b7365287b7962f2dcaed9ca482438d1c60.svg](https://3-im.guokr.com/formula/1848f3b7365287b7962f2dcaed9ca482438d1c60.svg)

![https://3-im.guokr.com/formula/44df64cc9dc5767483c43d3c46fbd72cb78e7f97.svg](https://3-im.guokr.com/formula/44df64cc9dc5767483c43d3c46fbd72cb78e7f97.svg)


得到迭代公式

![https://1-im.guokr.com/formula/768b411ac2ba3b8e23a2e85f2dfc565ecf2d13b9.svg](https://1-im.guokr.com/formula/768b411ac2ba3b8e23a2e85f2dfc565ecf2d13b9.svg)

# refer

[[LeetCode(Q69)] Sqrt(x) (编程实现sqrt)](http://www.cnblogs.com/AnnieKim/archive/2013/04/18/3028607.html)

[求牛顿开方法的算法及其原理，此算法能开任意次方吗?](https://www.guokr.com/question/461510/)
