# power-of-two

[https://leetcode.com/problems/power-of-two/](https://leetcode.com/problems/power-of-two/)

```
Given an integer, write a function to determine if it is a power of two.

Example 1:

Input: 1
Output: true 
Explanation: 20 = 1
Example 2:

Input: 16
Output: true
Explanation: 24 = 16
Example 3:

Input: 218
Output: false
```

# solution (no loop)

找到2进制在32位下的最大值，看是否能整除2.

```c++
class Solution {
public:
    bool isPowerOfTwo(int n) {
        return (n > 0 && 2147483648 % n == 0);
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Power of Two.
//Memory Usage: 8.1 MB, less than 41.85% of C++ online submissions for Power of Two.
```

# solution (bit)

仔细观察2的进制数可以发现一个规律，最高位都是1，而其他位都为0，那么做这样的计算 **(n & (n-1)) **，如果n为2的次幂，那么 n-1 的二进制除了最高位为0外，其他位均为1，即当n=8时，二进制为 1000 ，而n-1的二进制位 0111，此时 对两数 **求与** 为0.

```
2^0 = 1       1
2^1 = 2      10
2^2 = 4     100
2^3 = 8    1000
```

```c++
class Solution {
public:
    bool isPowerOfTwo(int n) {
        return (n > 0) && (!(n & (n-1)));
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Power of Two.
//Memory Usage: 8.3 MB, less than 5.02% of C++ online submissions for Power of Two.
```