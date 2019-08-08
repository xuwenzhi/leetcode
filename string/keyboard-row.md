# keyboard-row

[https://leetcode.com/problems/keyboard-row/](https://leetcode.com/problems/keyboard-row/)

```
Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.

```
![](https://assets.leetcode.com/uploads/2018/10/12/keyboard.png)
```
Example:

Input: ["Hello", "Alaska", "Dad", "Peace"]
Output: ["Alaska", "Dad"]
 

Note:

You may use one character in the keyboard more than once.
You may assume the input string will only contain letters of alphabet.
```

# solution 

```c+
class Solution {
public:
    bool isSameRow(string word) {
        if (word == "") return true;
        int idx = -1;
        for (int i=0;i<3;i++) {
            for (char c:v[i]) {
                if (c == tolower(word[0])) {
                    idx = i;
                    break;
                }
            }
        }
        for (char c:word) {
            if (v[idx].find(tolower(c)) == string::npos) return false;
        }
        
        return true;
    }
    
    vector<string> findWords(vector<string>& words) {
        vector<string> res;
        for (auto word:words) {
            if (isSameRow(word)) res.push_back(word);
        }
        
        return res;
    }
private:
    vector<string> v = {
        "qwertyuiop",
        "asdfghjkl",
        "zxcvbnm"
    };
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Keyboard Row.
//Memory Usage: 8.4 MB, less than 100.00% of C++ online submissions for Keyboard Row.
```