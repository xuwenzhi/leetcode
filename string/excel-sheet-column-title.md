# excel-sheet-column-title

[https://leetcode.com/problems/excel-sheet-column-title/](https://leetcode.com/problems/excel-sheet-column-title/)

```
Given a positive integer, return its corresponding column title as appear in an Excel sheet.

For example:

    1 -> A
    2 -> B
    3 -> C
    ...
    26 -> Z
    27 -> AA
    28 -> AB 
    ...
Example 1:

Input: 1
Output: "A"
Example 2:

Input: 28
Output: "AB"
Example 3:

Input: 701
Output: "ZY"
```

# solution 

```
class Solution {
public:
    string convertToTitle(int n) {
        if (n <= 0) return "";
        string res;
        while (n > 0) {
            int tmp = n % 26;// tmp如果是0，则这个字母刚好是 Z
            res += tmp == 0 ? 'Z' : (tmp-1 + 'A');
            
            // tmp是0的话，需要对27进行除，或者也对26进行除，然后再减一，方法很多
            n /= tmp == 0 ? 27 : 26;
        }
        
        reverse(res.begin(), res.end());
        return res;
    }
};
//Runtime: 4 ms, faster than 82.25% of C++ online submissions for Excel Sheet Column Title.
//Memory Usage: 8.1 MB, less than 72.09% of C++ online submissions for Excel Sheet Column Title.
```