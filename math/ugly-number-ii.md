# ugly-number-ii

[https://leetcode.com/problems/ugly-number-ii/](https://leetcode.com/problems/ugly-number-ii/)

```
Write a program to find the n-th ugly number.

Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.

Example:

Input: n = 10
Output: 12
Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.
Note:

1 is typically treated as an ugly number.
n does not exceed 1690.
```

# thinking

一个ugly-number的序列如下:

1 2 3 4(2*2) 5 6(2*3) 8(2*2*2) 9(3*3) 10(2*5) 12(2*2*3) 15(3*5)..

# solution

```
class Solution {
public:
    int nthUglyNumber(int n) {
        if (n <= 0) return 0;
        if (n == 1) return 1;

        vector<int> res(n);
        int i2=0,i3=0,i5=0;
        res[0] = 1;
        for (int i=1;i<n;i++) {
            res[i] = min(res[i2] * 2, min(res[i3] * 3, res[i5] * 5));

            if (res[i] == 2 * res[i2]) i2++;
            if (res[i] == 3 * res[i3]) i3++;
            if (res[i] == 5 * res[i5]) i5++;
        }

        return res[n-1];
    }
};
//Runtime: 8 ms, faster than 96.64% of C++ online submissions for Ugly Number II.
//Memory Usage: 9.9 MB, less than 66.44% of C++ online submissions for Ugly Number II.
```
