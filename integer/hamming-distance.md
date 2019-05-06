# hamming-distance

[https://leetcode.com/problems/hamming-distance/](https://leetcode.com/problems/hamming-distance/)

```
The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

Given two integers x and y, calculate the Hamming distance.

Note:
0 ≤ x, y < ^31.

Example:

Input: x = 1, y = 4

Output: 2

Explanation:
1   (0 0 0 1)
4   (0 1 0 0)
       ↑   ↑

The above arrows point to positions where the corresponding bits are different.
```

# solution

汉明距离也就是两个数字的二进制的不相等的数目，嗯，所以本题是将两个数字转为等位二进制，因为题目中要求**0 <= x,y < 2^31**，所以将两个十进制数转为等长度32位的二进制字符串，然后再遍历一遍数字计算x,y不相等的次数就可以了.

```c++
class Solution {
public:
    int hammingDistance(int x, int y) {
        string a = std::bitset< 32 >( x ).to_string();
        string b = std::bitset< 32 >( y ).to_string();

        int res = 0;
        for (int i=a.size()-1;i>=0;i--) {
            if (a[i] != b[i]) res++;
        }

        return res;
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Hamming Distance.
//Memory Usage: 8.2 MB, less than 99.64% of C++ online submissions for Hamming Distance.
```
