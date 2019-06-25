# isomorphic-strings

[https://leetcode.com/problems/isomorphic-strings/](https://leetcode.com/problems/isomorphic-strings/)

```
Given two strings s and t, determine if they are isomorphic.

Two strings are isomorphic if the characters in s can be replaced to get t.

All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.

Example 1:

Input: s = "egg", t = "add"
Output: true
Example 2:

Input: s = "foo", t = "bar"
Output: false
Example 3:

Input: s = "paper", t = "title"
Output: true
Note:
You may assume both s and t have the same length.
```

# solution 

```c++
class Solution {
public:
    bool isIsomorphic(string s, string t) {
        unordered_map<char, char> ms;
        unordered_map<char, char> mt;
        for (int i=0;i<s.size();i++) {
            if (ms.count(s[i]) ^ mt.count(t[i])) 
                return false;
            if (ms.count(s[i]) && mt.count(t[i])) {
                if (t[i] != ms[s[i]] 
                    || mt[t[i]] != s[i])
                    return false;
                    
            } else {
                ms[s[i]] = t[i];
                mt[t[i]] = s[i];
            }
        }
        
        return true;
    }
};
//Runtime: 12 ms, faster than 60.46% of C++ online submissions for Isomorphic Strings.
//Memory Usage: 9.2 MB, less than 49.67% of C++ online submissions for Isomorphic Strings.
```