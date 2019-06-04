# backspace-string-compare

[https://leetcode.com/problems/backspace-string-compare/](https://leetcode.com/problems/backspace-string-compare/)

```
Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

Example 1:

Input: S = "ab#c", T = "ad#c"
Output: true
Explanation: Both S and T become "ac".
Example 2:

Input: S = "ab##", T = "c#d#"
Output: true
Explanation: Both S and T become "".
Example 3:

Input: S = "a##c", T = "#a#c"
Output: true
Explanation: Both S and T become "c".
Example 4:

Input: S = "a#c", T = "b"
Output: false
Explanation: S becomes "c" while T becomes "b".
Note:

1 <= S.length <= 200
1 <= T.length <= 200
S and T only contain lowercase letters and '#' characters.
Follow up:

Can you solve it in O(N) time and O(1) space?
```

# solution

```c++
class Solution {
public:
    vector<char> helper(string s) {
        vector<char> res;
        for (auto i:s) {
            if (i != '#') {
                res.push_back(i);
            } else {
                if (!res.empty()) 
                    res.pop_back();
            }
        }
        
        return res;
    }

    bool backspaceCompare(string S, string T) {
        vector<char> s,t;
        s = helper(S);
        t = helper(T);
        
        if (s.size() != t.size()) return false;
        
        for (int i=0;i<s.size();i++) {
            if (s[i] != t[i]) return false;
        }
        
        return true;
    }
};
//Runtime: 4 ms, faster than 88.59% of C++ online submissions for Backspace String Compare.
//Memory Usage: 8.7 MB, less than 56.77% of C++ online submissions for Backspace String Compare.
```