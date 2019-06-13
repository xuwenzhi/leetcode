# excel-sheet-column-number

[https://leetcode.com/problems/excel-sheet-column-number/](https://leetcode.com/problems/excel-sheet-column-number/)

```
Given a column title as appear in an Excel sheet, return its corresponding column number.

For example:

    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28 
    ...
Example 1:

Input: "A"
Output: 1
Example 2:

Input: "AB"
Output: 28
Example 3:

Input: "ZY"
Output: 701
```

# solution 

```c++
class Solution {
public:
    int titleToNumber(string s) {
        int res = 0;
        int base = 26, j = 0;
        for (int i=s.length()-1;i>=0;i--) {
            res += j == 0 ? s[i]-'A'+1 : (s[i] - 'A' + 1) * pow(26,j);
            j++;
        }
        
        return res;
    }
};
//Runtime: 4 ms, faster than 90.77% of C++ online submissions for Excel Sheet Column Number.
//Memory Usage: 8.4 MB, less than 7.12% of C++ online submissions for Excel Sheet Column Number.
```