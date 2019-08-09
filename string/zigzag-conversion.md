# zigzag-conversion

[https://leetcode.com/problems/zigzag-conversion/](https://leetcode.com/problems/zigzag-conversion/)

```
The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R
And then read line by line: "PAHNAPLSIIGYIR"

Write the code that will take a string and make this conversion given a number of rows:

string convert(string s, int numRows);
Example 1:

Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"
Example 2:

Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:

P     I    N
A   L S  I G
Y A   H R
P     I
```

# thinking

今天心血来潮，来搞一搞前面没有做过的题，这道题首当其冲，当然，了解题意就费了点时间，就冲着那么多的踩，我也做好了心里准备，一开始想的还挺简单的，只要找到 **每一行numRows所能跨越的距离** 就可以了，所以最开始我总结的公式是这样的。

```c++
while (i < numRows) {
    if (i == 0 || i + 1 == numRows) {
        j += 2*(numRows-1);
    } else {
        j += 2*(numRows-i-1);
    }
}
```

但是后来执行出现了问题，**我忽略了这种case**，当从下往上增长的时候，公式还会有点不一样!

比如下面这种case，在第二排中，A -> L 按照上面的公式是没问题的，但是当 L -> S 的这种情况上面的公式就over了，所以还要考虑是从上往下或者从下往上，这里我用了个中间变量，用于表示 **奇偶数** 来解决了。
```
P     I    N
A   L S  I G
Y A   H R
P     I
```

```
int odd = 0;
while (j < s.length()) {
    res += s[j];
    if (i == 0 || i+1 == numRows) {
        j += 2*(numRows-1);
    } else {
        j += odd % 2 == 0 
            ? 2*(numRows-i-1) 
            : 2*i;
    }
    odd++; // 使用这个来表示从上到下还是从下到上。
}
```

# solution 

```c++
class Solution {
public:
    string convert(string s, int numRows) {
        if (numRows <= 1) return s;
        if (numRows >=s.length()) return s;
        
        int i = 0;
        string res = "";
        while (i < numRows) {
            int j = i, odd=0;
            while (j < s.length()) {
                res += s[j];
                if (i == 0 || i+1 == numRows) {
                    j += 2*(numRows-1);
                } else {
                    j += odd % 2 == 0 
                        ? 2*(numRows-i-1) 
                        : 2*i;
                }
                odd++;
            }
            i++;
        }
        
        return res;
    }
};
//Runtime: 12 ms, faster than 77.49% of C++ online submissions for ZigZag Conversion.
//Memory Usage: 10.3 MB, less than 83.33% of C++ online submissions for ZigZag Conversion.
```