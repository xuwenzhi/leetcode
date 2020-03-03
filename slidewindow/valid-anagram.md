# valid-anagram

[https://leetcode.com/problems/valid-anagram/](https://leetcode.com/problems/valid-anagram/)

```
Given two strings s and t , write a function to determine if t is an anagram of s.

Example 1:

Input: s = "anagram", t = "nagaram"
Output: true
Example 2:

Input: s = "rat", t = "car"
Output: false
Note:
You may assume the string contains only lowercase alphabets.

Follow up:
What if the inputs contain unicode characters? How would you adapt your solution to such case?


```

# solution

这个题实际上和[[Easy]find-all-anagrams-in-a-string - 找到所有乱序字符串](https://github.com/xuwenzhi/leetcode/blob/master/string/find-all-anagrams-in-a-string.md)一个样了。

```c++
// O(n)
class Solution {
public:
    bool isAnagram(string s, string t) {
        int ls = s.size();
        int lt = t.size();
        if (ls != lt) return false;

        vector<int> vecs(26, 0), vect(26,0);

        for (char c : s) {
            vecs[c-'a']++;
        }
        for (char c : t) {
            vect[c-'a']++;
        }

        return vecs == vect;
    }
};
//Runtime: 12 ms, faster than 98.39% of C++ online submissions for Valid Anagram.
//Memory Usage: 9.6 MB, less than 5.16% of C++ online submissions for Valid Anagram.
```
