# add-strings

[https://leetcode.com/problems/add-strings/](https://leetcode.com/problems/add-strings/)

```
Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.

Note:

The length of both num1 and num2 is < 5100.
Both num1 and num2 contains only digits 0-9.
Both num1 and num2 does not contain any leading zero.
You must not use any built-in BigInteger library or convert the inputs to integer directly.
```

# thinking

这个问题和[add-binary](https://github.com/xuwenzhi/leetcode/blob/master/string/add-binary.md)这个就属于一个问题.

# solution

```
class Solution {
public:
    string addStrings(string num1, string num2) {
        char c[5101];
        int len1 = num1.size(), len2 = num2.size();
        int i = len1 - 1, j = len2 - 1, over = 0, sum = 0, k = 0;
        while (i >= 0 || j >= 0 || over > 0) {
            sum = 0;
            if (i >= 0) {
                sum += (num1[i] - '0');
            }
            if (j >= 0) {
                sum += (num2[j] - '0');
            }
            sum += over;
            over = sum > 10 ? 1 : 0;
            if (sum >= 10) {
                over = 1;
            }
            c[k++] = sum % 10 + '0';
            i--;
            j--;
        }
        c[k] = '\0';

        for (int i = 0; i < k / 2; i++) {
            char tmp = c[k-i-1];
            c[k-i-1] = c[i];
            c[i] = tmp;
        }

        return c;
    }
};
```

Success

Details

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Add Strings.

Memory Usage: 8.8 MB, less than 100.00% of C++ online submissions for Add Strings.
