# reverse-words-in-a-string

[https://leetcode.com/problems/reverse-words-in-a-string/](https://leetcode.com/problems/reverse-words-in-a-string/)

```
Given an input string, reverse the string word by word.

 

Example 1:

Input: "the sky is blue"
Output: "blue is sky the"
Example 2:

Input: "  hello world!  "
Output: "world! hello"
Explanation: Your reversed string should not contain leading or trailing spaces.
Example 3:

Input: "a good   example"
Output: "example good a"
Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
 

Note:

A word is defined as a sequence of non-space characters.
Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
You need to reduce multiple spaces between two words to a single space in the reversed string.
 

Follow up:

For C programmers, try to solve it in-place in O(1) extra space.
```

# thinking
这个题就是从右向左走起，因为只有字母和空格，所以遇到空格就跳过，遇到单词把最有位置记录下来并继续向左，然后做**substr**操作，拼接到**res**就完事了。

Notice:别越界。

# solution

```c++
// O(n) Runtime O(1) Space
class Solution {
public:
    string reverseWords(string s) {
        int i = 0, len = s.size();
        if (len == 0) return s;
        string res;
        int high = len-1;
        while (high >= 0) {
            while (high >= 0 && s[high] == ' ') {
                high--;
            }
            if (high < 0) break;
            int r = high;
            string tmp = "";
            int start = i;
            while (high >= 0 && s[high] != ' ') {
                high--;
            }
            tmp = s.substr(high+1, r-high);
            
            if (res == "") res = tmp;
            else res += " " + tmp;
        }
        
        return res;
    }
};
```
Runtime: 8 ms, faster than 99.66% of C++ online submissions for Reverse Words in a String.

Memory Usage: 10.6 MB, less than 19.64% of C++ online submissions for Reverse Words in a String.
