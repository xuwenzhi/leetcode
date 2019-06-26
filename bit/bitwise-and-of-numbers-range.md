# bitwise-and-of-numbers-range

[https://leetcode.com/problems/bitwise-and-of-numbers-range/](https://leetcode.com/problems/bitwise-and-of-numbers-range/)

```
Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.

Example 1:

Input: [5,7]
Output: 4
Example 2:

Input: [0,1]
Output: 0
```


# solution ( >> )

右移，找出 m 和 n 的公共部分。

```
class Solution {
public:
    int rangeBitwiseAnd(int m, int n) {
        int t = 0;
        
        while (m != n) {
            m >>=1;
            n >>=1;
            t++;
        }
        
        return m << t;
    }
};
//Runtime: 20 ms, faster than 63.86% of C++ online submissions for Bitwise AND of Numbers Range.
//Memory Usage: 8.2 MB, less than 37.20% of C++ online submissions for Bitwise AND of Numbers Range.
```


# solution (remove low bit)

> 如果m小于n就进行循环，n与上n-1，那么为什么要这样与呢，举个简单的例子呗，110与上(110-1)，得到100，这不就相当于去掉最低位的1么，n就这样每次去掉最低位的1，如果小于等于m了，返回此时的n即可

```
class Solution {
public:
    int rangeBitwiseAnd(int m, int n) {
        while (m < n) n &= (n - 1);
        return n;
    }
};
//Runtime: 12 ms, faster than 88.15% of C++ online submissions for Bitwise AND of Numbers Range.
//Memory Usage: 8.2 MB, less than 21.90% of C++ online submissions for Bitwise AND of Numbers Range.
```

# refer

[[LeetCode] Bitwise AND of Numbers Range 数字范围位相与](https://www.cnblogs.com/grandyang/p/4431646.html)