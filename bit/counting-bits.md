# counting-bits

[https://leetcode.com/problems/counting-bits/](https://leetcode.com/problems/counting-bits/)

```
Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.

Example 1:

Input: 2
Output: [0,1,1]
Example 2:

Input: 5
Output: [0,1,1,2,1,2]
Follow up:

It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
Space complexity should be O(n).
Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
```

# solution (built-in bitset<32>)

```c++
class Solution {
public:
    vector<int> countBits(int num) {
        vector<int> res;
        int n = 0;
        while (n <= num) {
            res.push_back(bitset<32>(n).count());
            n++;
        }
        
        return res;
    }
};
//Runtime: 56 ms, faster than 63.46% of C++ online submissions for Counting Bits.
//Memory Usage: 10.2 MB, less than 9.32% of C++ online submissions for Counting Bits.
```

# solution (regular pattern)

这个解决方案就是按照规律来了。

> 除去前两个数字0个1，从2开始，2和3，是 [21, 22) 区间的，值为1和2。而4到7属于 [22, 23) 区间的，值为 1,2,2,3，前半部分1和2和上一区间相同，2和3是上面的基础上每个数字加1

// O(n) Runtime, O(1) Space.
```c++
class Solution {
public:
    vector<int> countBits(int num) {
        if (num == 0) return {0};
        if (num == 1) return {0,1};
        vector<int> res{0,1};
        
        int i = 1;
        while (true) {
            int low = pow(2, i);
            int high = pow(2, i+1);
            int base = pow(2, i-1);
            
            for (int j=0;low+j<high && low+j<=num;j++) {
                if (j < (high-low)/2) {
                    res.push_back(res[base+j]);
                } else {
                    res.push_back(res[base+j]+1);   
                }
            }
            
            if (high > num) break;
            i++;
        }

        return res;
    }
};
//Runtime: 48 ms, faster than 99.96% of C++ online submissions for Counting Bits.
//Memory Usage: 10.5 MB, less than 5.01% of C++ online submissions for Counting Bits.
```
# solution (&)

> 下面这种方法就更加巧妙了，巧妙的利用了 i&(i - 1)， 这个本来是用来判断一个数是否是2的指数的快捷方法，比如8，二进制位 1000, 那么 8&(8-1) 为0，只要为0就是2的指数, 那么我们现在来看一下0到 15 的数字和其对应的 i&(i - 1) 值：

```
i    binary '1'  i&(i-1)
0    0000    0
-----------------------
1    0001    1    0000
-----------------------
2    0010    1    0000
3    0011    2    0010
-----------------------
4    0100    1    0000
5    0101    2    0100
6    0110    2    0100
7    0111    3    0110
-----------------------
8    1000    1    0000
9    1001    2    1000
10   1010    2    1000
11   1011    3    1010
12   1100    2    1000
13   1101    3    1100
14   1110    3    1100
15   1111    4    1110
```

```c++
class Solution {
public:
    vector<int> countBits(int num) {
        vector<int> res(num + 1, 0);
        for (int i = 1; i <= num; ++i) {
            res[i] = res[i & (i - 1)] + 1;
        }
        return res;
    }
};
```


# points

1. 判断是否是2的指数， n&(n-1) == 0

# refer

[[LeetCode] Counting Bits 计数位](https://www.cnblogs.com/grandyang/p/5294255.html)