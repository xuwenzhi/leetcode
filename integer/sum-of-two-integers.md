# sum-of-two-integers

[https://leetcode.com/problems/sum-of-two-integers](https://leetcode.com/problems/sum-of-two-integers)

# thinking

![https://github.com/xuwenzhi/leetcode/raw/master/images/sum-of-two-integers.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/sum-of-two-integers.jpg)

这道题相加两个数，但不能使用'+'，所以自然而然想到通过位运算来解决，具体看图，本题的思路使用 **&** 和 **^** 来计算两个数的总和，使得其中一个数在不断削减，另一个数不断增加，但总和保持一致。

不过还需要考虑一些问题，比如两数中存在负数的情况下，如果负数已经达到最高位，此时 **<<** 会溢出，比如输入"-1, 1"，记录 **a, b**的中间变量如下

```
-3:4
-7:8
// 省略
-536870911:536870912
-1073741823:1073741824
-2147483647:-2147483648
1:0
```
当a = -1073741823, b = 1073741824时，此时的计算为

```
(
1073741824 (1000000000000000000000000000000)
&
-1073741823 (0111111111111111111111111111111)
&
0x7FFFFFFF (0111111111111111111111111111111)
) << 1

结果为INT_MIN = -2147483648 (1111111111111111111111111111111)
```

> 负数的二进制码都是其补码。负数的右移：需要保持数为负数，所以操作是对负数的二进制位左边补1。如果一直右移，最终会变成-1，即(-1)>>1是-1。 负数的左移：和整数左移一样，在负数的二进制位右边补0，一个数在左移的过程中会有正有负的情况，所以切记负数左移不会特殊处理符号位。如果一直左移，最终会变成0.

# solution

```c++
class Solution {
public:
    int getSum(int a, int b) {
        if (b == 0) {
            return a;
        }
        int sum = a ^ b;

        int carry = ((long long)(a & b) & 0xffffffff) << 1;
        return getSum(sum, carry);
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Sum of Two Integers.
//Memory Usage: 8.1 MB, less than 67.65% of C++ online submissions for Sum of Two Integers.
```


# bit manipulation application

[A summary: how to use bit manipulation to solve problems easily and efficiently](https://leetcode.com/problems/sum-of-two-integers/discuss/84278/)
