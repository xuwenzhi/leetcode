# power-of-four

[https://leetcode.com/problems/power-of-four/](https://leetcode.com/problems/power-of-four/)

```
Given an integer (signed 32 bits), write a function to check whether it is a power of 4.

Example 1:

Input: 16
Output: true
Example 2:

Input: 5
Output: false
Follow up: Could you solve it without loops/recursion?
```

# thinking

这个会有点小曲折的原因是，因为4存在2的因子，所以有可能存在是2的次方，但并不是4的次方，比如8这个数字。

下面是两个解决方案，一个是传统的loop的方式，另外一种是通过[https://github.com/xuwenzhi/leetcode/blob/master/integer/power-of-two.md](https://github.com/xuwenzhi/leetcode/blob/master/integer/power-of-two.md)转移而来。

# solution (loop) 

```c++
class Solution {
public:
    bool isPowerOfFour(int num) {
        if (num <= 0) return false;
        while (num > 0) {
            if (num == 1) return true;
            if (num % 4 != 0) return false;
            num /= 4;
        }

        return true;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Power of Four.
//Memory Usage: 8.1 MB, less than 33.26% of C++ online submissions for Power of Four.
```

# solution

因为如果是2的次方，那么就有可能是4的次方，那么此时再增加一个限定4的判断即可。有个定理，假如n是4的倍数，那么n-1就是3的倍数，所以就加了这么个判断 **(num-1) % 3 == 0**

```c++
class Solution {
public:
    bool isPowerOfFour(int num) {
        return (num > 0) && (!(num & (num-1))) && (num-1) % 3 == 0;
    }
};
//Runtime: 4 ms, faster than 92.06% of C++ online submissions for Power of Four.
//Memory Usage: 8.1 MB, less than 42.00% of C++ online submissions for Power of Four.
```