# to-lower-case

[https://leetcode.com/problems/to-lower-case/](https://leetcode.com/problems/to-lower-case/)

```
Implement function ToLowerCase() that has a string parameter str, and returns the same string in lowercase.

 

Example 1:

Input: "Hello"
Output: "hello"
Example 2:

Input: "here"
Output: "here"
Example 3:

Input: "LOVELY"
Output: "lovely"
```

# solution

```c++
class Solution {
public:
    string toLowerCase(string str) {
        for (auto &i:str) {
            if (i >= 'A' && i <= 'Z') {
                i += 32;
            }
        }
        
        return str;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for To Lower Case.
//Memory Usage: 8.4 MB, less than 7.27% of C++ online submissions for To Lower Case.
```