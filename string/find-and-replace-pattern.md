# find-and-replace-pattern

[https://leetcode.com/problems/find-and-replace-pattern/](https://leetcode.com/problems/find-and-replace-pattern/)

```
You have a list of words and a pattern, and you want to know which words in words matches the pattern.

A word matches the pattern if there exists a permutation of letters p so that after replacing every letter x in the pattern with p(x), we get the desired word.

(Recall that a permutation of letters is a bijection from letters to letters: every letter maps to another letter, and no two letters map to the same letter.)

Return a list of the words in words that match the given pattern. 

You may return the answer in any order.

 

Example 1:

Input: words = ["abc","deq","mee","aqq","dkd","ccc"], pattern = "abb"
Output: ["mee","aqq"]
Explanation: "mee" matches the pattern because there is a permutation {a -> m, b -> e, ...}. 
"ccc" does not match the pattern because {a -> c, b -> c, ...} is not a permutation,
since a and b map to the same letter.
 

Note:

1 <= words.length <= 50
1 <= pattern.length = words[i].length <= 20
```

# thinking

之前好像做过这样的题，嗯，[[Easy]word-pattern - 单词匹配](https://github.com/xuwenzhi/leetcode/blob/master/string/word-pattern.md)，是这道。基本思路就是 **用hashtable存储pattern到String 的字符映射** 而且得用两个hashtable，互相映射才行。

比如 pattern : "abc" 和 string :"ccc"
顺序搞下来，其实映射是 

```c++
m["a"] = "c"
m["b"] = "c"
m["c"] = "c"
```
这样无法判断是一个pattern，在那道题里也说明了这个问题。

# solution 

```
class Solution {
public:
    vector<string> findAndReplacePattern(vector<string>& words, string pattern) {
        vector<string> res;
        unordered_map<char,char> m,p;

        for (int i=0;i<words.size();i++) {
            int j = 0;
            for (;j<words[i].size();j++) {
                char s = words[i][j];
                char c = pattern[j];
                if (m.find(s) != m.end() ^ p.find(c) != p.end()) {
                    break;
                }
                if (m.find(s) != m.end() && p.find(c) != p.end()) {
                    if (m[s] != pattern[j] || p[c] != s) break;
                }
                if (m.find(s) == m.end())
                    m[s] = c;
                if (p.find(c) == p.end())
                    p[c] = s;
            }
            if (j == words[i].size()) {
                res.push_back(words[i]);
            }
            m.clear();
            p.clear();
        }
        
        return res;
    }
};
//Runtime: 8 ms, faster than 53.12% of C++ online submissions for Find and Replace Pattern.
//Memory Usage: 9.3 MB, less than 76.76% of C++ online submissions for Find and Replace Pattern.
```