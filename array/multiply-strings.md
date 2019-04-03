# multiply-strings

[https://leetcode.com/problems/multiply-strings/](https://leetcode.com/problems/multiply-strings/)

```
Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

Example 1:

Input: num1 = "2", num2 = "3"
Output: "6"
Example 2:

Input: num1 = "123", num2 = "456"
Output: "56088"
Note:

The length of both num1 and num2 is < 110.
Both num1 and num2 contain only digits 0-9.
Both num1 and num2 do not contain any leading zero, except the number 0 itself.
You must not use any built-in BigInteger library or convert the inputs to integer directly.
```

# thinking

最开始想错了，以为只是对应位置相乘，后来才想明白，原来真的是相乘。

所以后来呢，楼下抽根烟，想了想。其实把整个相乘过程划分成单个数相乘就好，比如 **"123" * "456"***，**假如先不考虑进位问题**，每个数字都要乘一遍另外的字符串，乘完之后位置其实是固定的，如图

![https://github.com/xuwenzhi/leetcode/raw/master/images/multiply-strings.jpeg](https://github.com/xuwenzhi/leetcode/raw/master/images/multiply-strings.jpeg)

经过处理完成之后就得到了 [18,27,28,13,4]，这样的数组，最后再做一次进位即可了.

# solution

```c++
class Solution {
public:
    int productchar(char c1, char c2) {
        return (c1 - '0') * (c2 - '0');
    }

	// 进位操作
    string flatten(vector<int> res) {
        vector<char> vc{};
        int cur = res.size()-1, over = 0;
        while (cur >= 0 || over) {
            int sum = over;
            if (cur>=0) sum += res[cur];
            over = sum / 10;
            vc.push_back(sum % 10 + '0');
            cur--;
        }

        string s{vc.rbegin(), vc.rend()};
        return s;
    }

    string multiply(string num1, string num2) {
        int num1Len = num1.size(), num2Len = num2.size();
        if (num1Len == 0 || num2Len == 0
            || num1 == "0" || num2 == "0") return "0";
        int cur1 = num1Len - 1, cur2 = num2Len - 1, over = 0;
        vector<int> product{};

        for (int i=num1Len-1;i>=0;i--) {
            int sum = 0,over = 0;
            for (int j=num2Len-1;j>=0 || over;j--) {
                int p = productchar(num1[i], num2[j]);
                int position = num2Len - j + num1Len - i - 2;
                if (position >= product.size()) {
                    product.push_back(p);
                } else {
                    product[position] += p;
                }
            }
        }

        reverse(std::begin(product), std::end(product));
        string str = flatten(product);

        return str.empty() ? "0" : str;
    }
};
```

Runtime: 8 ms, faster than 98.85% of C++ online submissions for Multiply Strings.

Memory Usage: 9.3 MB, less than 100.00% of C++ online submissions for Multiply Strings.
