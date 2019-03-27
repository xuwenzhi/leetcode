# add-binary[easy]

[https://leetcode.com/problems/add-binary/](https://leetcode.com/problems/add-binary/)

# thinking

```
Given two binary strings, return their sum (also a binary string).

The input strings are both non-empty and contains only characters 1 or 0.

Example 1:

Input: a = "11", b = "1"
Output: "100"
Example 2:

Input: a = "1010", b = "1011"
Output: "10101"
```


这个题有点类似于[add-two-numbers-ii](https://github.com/xuwenzhi/leetcode/blob/master/linked-list/add-two-numbers-ii.md)，从右向左依次相加并且再维护一个over变量即可.


# solution

```
class Solution {
public:
    string addBinary(string a, string b) {
        char c[100];
        int aLen = a.size(), bLen = b.size();
        int cura = aLen-1, curb = bLen-1;
        int over = 0, sum =0, curc = 0;
        while (cura >= 0 || curb >= 0 || over > 0) {
            sum = 0;
            if (cura >= 0) {
                sum += a[cura] - '0';
            }
            if (curb >= 0) {
                sum += b[curb] - '0';
            }
            sum += over;
            over = sum >= 2 ? 1 : 0;
            c[curc++] = sum % 2 + '0';
            cura--;
            curb--;
        }
        c[curc] = '\0';

        for (int i = 0; i < curc / 2; i++) {
            char tmp = c[curc-i-1];
            c[curc-i-1] = c[i];
            c[i] = tmp;
        }

        return c;
    }
};
```

Success

Details

Runtime: 8 ms, faster than 68.70% of C++ online submissions for Add Binary.

Memory Usage: 8.6 MB, less than 65.63% of C++ online submissions for Add Binary.
