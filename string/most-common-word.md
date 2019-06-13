# most-common-word

[https://leetcode.com/problems/most-common-word/](https://leetcode.com/problems/most-common-word/)

```
Given a paragraph and a list of banned words, return the most frequent word that is not in the list of banned words.  It is guaranteed there is at least one word that isn't banned, and that the answer is unique.

Words in the list of banned words are given in lowercase, and free of punctuation.  Words in the paragraph are not case sensitive.  The answer is in lowercase.

 

Example:

Input: 
paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
banned = ["hit"]
Output: "ball"
Explanation: 
"hit" occurs 3 times, but it is a banned word.
"ball" occurs twice (and no other word does), so it is the most frequent non-banned word in the paragraph. 
Note that words in the paragraph are not case sensitive,
that punctuation is ignored (even if adjacent to words, such as "ball,"), 
and that "hit" isn't the answer even though it occurs more because it is banned.
 

Note:

1 <= paragraph.length <= 1000.
0 <= banned.length <= 100.
1 <= banned[i].length <= 10.
The answer is unique, and written in lowercase (even if its occurrences in paragraph may have uppercase symbols, and even if it is a proper noun.)
paragraph only consists of letters, spaces, or the punctuation symbols !?',;.
There are no hyphens or hyphenated words.
Words only consist of letters, never apostrophes or other punctuation symbols.
```

# thinking

所以，必须要踩一下这个题。

# solution 

```c++
class Solution {
public:
    string mostCommonWord(string paragraph, vector<string>& banned) {
        unordered_map<string,int> m;
        unordered_map<string,bool> b;
        
        for (auto s : banned) {
            b[s] = true;
        }
        
        int count = 0;
        string t = "", res;
        for (int i=0;i<=paragraph.size();i++) {
            // 由于我是从头到尾判断的，当指针到字符串末尾的时候，也不要忽略最后一个词
            if (i == paragraph.size()) {
                if (t != "" && !b.count(t)) {
                    m[t]++;
                }
                break;
            }
            char c = paragraph[i];
            if (!isalpha(c)) {
                if (t != "" && !b.count(t)) {
                    m[t]++;
                }
                t = "";
                continue;
            }
            if (c >= 'A' && c<='z') c = tolower(c);
            t += c;
        }
        
        for (auto s : m) {
            if (s.second > count) {
                res = s.first;
                count = s.second;
            }
        }
        
        return res;
    }
};
```