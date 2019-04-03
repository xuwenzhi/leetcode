# valid-parentheses

[https://leetcode.com/problems/valid-parentheses/](https://leetcode.com/problems/valid-parentheses/)

```
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Note that an empty string is also considered valid.

Example 1:

Input: "()"
Output: true
Example 2:

Input: "()[]{}"
Output: true
Example 3:

Input: "(]"
Output: false
Example 4:

Input: "([)]"
Output: false
Example 5:

Input: "{[]}"
Output: true
```

# solution

```c++
class Solution {
public:
    bool isValid(string s) {
        int cur = 0;
        stack<char> cstack{};
        while (cur < s.size()) {
            if (s[cur] == '(' || s[cur] == '[' || s[cur] == '{') {
                cstack.push(s[cur]);
            }

            if (s[cur] == ')' || s[cur] == ']' || s[cur] == '}') {
                if (cstack.empty()) return false;
                if ( (cstack.top() == '(' && ')'!= s[cur])
                    || (cstack.top() == '[' && ']'!= s[cur])
                    || (cstack.top() == '{' && '}'!= s[cur])
                   ) return false;
                cstack.pop();
            }
            cur++;
        }
        if (!cstack.empty()) return false;

        return true;
    }
};
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Valid Parentheses.

Memory Usage: 8.5 MB, less than 99.75% of C++ online submissions for Valid Parentheses.
