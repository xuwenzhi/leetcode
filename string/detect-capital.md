# detect-capital

[https://leetcode.com/problems/detect-capital/](https://leetcode.com/problems/detect-capital/)

```
Given a word, you need to judge whether the usage of capitals in it is right or not.

We define the usage of capitals in a word to be right when one of the following cases holds:

All letters in this word are capitals, like "USA".
All letters in this word are not capitals, like "leetcode".
Only the first letter in this word is capital if it has more than one letter, like "Google".
Otherwise, we define that this word doesn't use capitals in a right way.
Example 1:

Input: "USA"
Output: True
Example 2:

Input: "FlaG"
Output: False
Note: The input will be a non-empty word consisting of uppercase and lowercase latin letters.
```
# solution

```
class Solution {
public:
    bool isGreater(char c) {
        return c >= 'A' && c <= 'Z';
    }
    bool detectCapitalUse(string word) {
        int len = word.size(), i = 0;
        if (len == 0) return true;
        bool firstGreater = isGreater(word[0]);
        bool isPassSmaller = false;
        bool isPassGreater = false;
        while (i < len) {
            if (i > 0 && !isGreater(word[i])) {
                isPassSmaller = true;
            }
            if (i > 0 && isGreater(word[i])) {
                isPassGreater = true;
            }
            if (isPassGreater && !isGreater(word[i])) {
                return false;
            }
            if (isPassSmaller && isGreater(word[i])) {
                return false;
            }
            if (i > 0 && !firstGreater && isGreater(word[i])) {
                return false;
            }
            i++;
        }
        return true;
    }
};
```

Success

Details

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Detect Capital.

Memory Usage: 8 MB, less than 100.00% of C++ online submissions for Detect Capital.
