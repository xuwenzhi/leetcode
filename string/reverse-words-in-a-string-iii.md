# reverse-words-in-a-string-iii

[https://leetcode.com/problems/reverse-words-in-a-string-iii/](https://leetcode.com/problems/reverse-words-in-a-string-iii/)

```
Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

Example 1:

Input: "Let's take LeetCode contest"
Output: "s'teL ekat edoCteeL tsetnoc"
Note: In the string, each word is separated by single space and there will not be any extra space in the string.
```

# solution 

```
class Solution {
public:
    string reverseWords(string s) {
        string t = "", res;
        int start=0;
        for (int i=0;i<s.size();i++) {
            int end = i, start = i;
            while (end < s.size() && s[end] != ' ') end++;
            t = s.substr(start, end-start);
            
            reverse(t.begin(), t.end());
            t += ' ';
            res += t;
            i = end;
        }
        
        return res.substr(0, res.size()-1);
    }
};
//Runtime: 28 ms, faster than 42.76% of C++ online submissions for Reverse Words in a String III.
//Memory Usage: 16.2 MB, less than 16.87% of C++ online submissions for Reverse Words in a String III.
```