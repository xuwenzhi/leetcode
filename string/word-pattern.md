# word-pattern

[https://leetcode.com/problems/word-pattern/](https://leetcode.com/problems/word-pattern/)

```
Given a pattern and a string str, find if str follows the same pattern.

Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.

Example 1:

Input: pattern = "abba", str = "dog cat cat dog"
Output: true
Example 2:

Input:pattern = "abba", str = "dog cat cat fish"
Output: false
Example 3:

Input: pattern = "aaaa", str = "dog cat cat dog"
Output: false
Example 4:

Input: pattern = "abba", str = "dog dog dog dog"
Output: false
Notes:
You may assume pattern contains only lowercase letters, and str contains lowercase letters that may be separated by a single space.
```

# solution

使用两个hashtable来解决，为什么要用两个呢？如果仅用一个pattern[i] -> 到 words[i] 的映射，这个case就行不通了，因为第一次循环 'a'->'dog' 第二次循环 'b' -> 'dog'，所以后续判断还是可以通过为 true。

```
"abba"
"dog dog dog dog"
```

所以就用两个来处理

```c++
class Solution {
public:
    bool wordPattern(string pattern, string str) {
        unordered_map<char, string> mp;
        unordered_map<string, char> mw;
        
        vector<string> words;
        string word;
        stringstream iis(str);
        while (iis >> word) {
            words.push_back(word);
        }
        
        if (words.size() != pattern.size()) return false;
        
        for (int i=0;i<words.size();i++) {
            // 如果这里仅有一个有，一个没有，也为false
            if (mp.count(pattern[i]) ^ mw.count(words[i])) 
                return false;
            if (mp.count(pattern[i]) && mw.count(words[i])) {
                if (words[i] != mp[pattern[i]] 
                    || mw[words[i]] != pattern[i])
                    return false;
                    
            } else {
                mp[pattern[i]] = words[i];
                mw[words[i]] = pattern[i];
            }
        }
        
        return true;
    }
};
//Runtime: 4 ms, faster than 74.59% of C++ online submissions for Word Pattern.
//Memory Usage: 8.6 MB, less than 57.79% of C++ online submissions for Word Pattern.
```