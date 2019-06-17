# reverse-string-ii

[https://leetcode.com/problems/reverse-string-ii/](https://leetcode.com/problems/reverse-string-ii/)

```c++
Given a string and an integer k, you need to reverse the first k characters for every 2k characters counting from the start of the string. If there are less than k characters left, reverse all of them. If there are less than 2k but greater than or equal to k characters, then reverse the first k characters and left the other as original.
Example:

Input: s = "abcdefg", k = 2
Output: "bacdfeg"
Restrictions:
The string consists of lower English letters only.
Length of the given string and k will in the range [1, 10000]
```

# solution 

每次向后遍历2*k次，然后对 [i, i+k] 区间进行reverse即可，考虑下边界。

```c++
class Solution {
public:
    string reverseStr(string s, int k) {
        if (s == "" || k <= 1) return s;
        
        int l = s.length();
        for (int i=0;i<l;i++) {
            int j = i;
            while (j < l && j-i < 2*k-1) {
                j++;
            }
            
            int end = i+k >= l ? l : i+k;
            reverse(s.begin()+i, s.begin() + end);
            i = j;
        }
        
        return s;
    }
};
//Runtime: 4 ms, faster than 98.78% of C++ online submissions for Reverse String II.
//Memory Usage: 9.7 MB, less than 43.96% of C++ online submissions for Reverse String II.
```