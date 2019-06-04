# decode-string

[https://leetcode.com/problems/decode-string/](https://leetcode.com/problems/decode-string/)

```
Given an encoded string, return it's decoded string.

The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

Examples:

s = "3[a]2[bc]", return "aaabcbc".
s = "3[a2[c]]", return "accaccacc".
s = "2[abc]3[cd]ef", return "abcabccdcdcdef".
```

# solution (recuration) 

以case "3[a]2[bc]" 为例，进行分组，3[a]为一组，2[bc]为一组，进行处理，当遇到 **[** 时执行i++，然后进入递归。这种分组同样也可以解决那种嵌套的case，例如 "3[a2[c]]" .

当然这个题用栈也可以解决，不过每次都将times和string 入栈，不过遇到嵌套的情况时，需要取两次栈顶，进行判断这次是什么类型，然后再做处理，会稍微麻烦点。

```c++
// O(n) Runtime, O(n) Space.
class Solution {
public:
    // int i is must be reference
    string helper(string s, int &i) {
        int l=s.size();
        if (i >= l) return "";
        string res = "";
        while (i < l && s[i] != ']') {
            if (!isdigit(s[i])) {
                res += s[i++];
            } else {
                // while循环计算，这次的times
                int n=0;
                while (i < l && isdigit(s[i])) {
                    n = n * 10 + (s[i]-'0');
                    i++;
                }
                i++; // 略过 '['
                string t = helper(s, i);
                i++; // 略过 ']'
                while (n-- > 0) {
                    // 进行n次的拼接
                    res += t;
                }
            }
        }
        
        return res;
    }
    
    string decodeString(string s) {
        int i = 0;
        string res = helper(s, i);
        
        return res;
    }
};
//Runtime: 4 ms, faster than 88.22% of C++ online submissions for Decode String.
//Memory Usage: 8.9 MB, less than 54.97% of C++ online submissions for Decode String.
```
# refer

[0ms-simple-C++-solution](https://leetcode.com/problems/decode-string/discuss/87543/)