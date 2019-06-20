# longest-repeating-character-replacement

[https://leetcode.com/problems/longest-repeating-character-replacement/](https://leetcode.com/problems/longest-repeating-character-replacement/)

```
Given a string that consists of only uppercase English letters, you can replace any letter in the string with another letter at most k times. Find the length of a longest substring containing all repeating letters you can get after performing the above operations.

Note:
Both the string's length and k will not exceed 104.

Example 1:

Input:
s = "ABAB", k = 2

Output:
4

Explanation:
Replace the two 'A's with two 'B's or vice versa.
Example 2:

Input:
s = "AABABBA", k = 1

Output:
4

Explanation:
Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.
```

# thinking

也是一道sliding window题目，这道题和那到[[Medium]max-consecutive-ones-iii - 最大连续1的长度III](https://github.com/xuwenzhi/leetcode/blob/master/array/max-consecutive-ones-iii.md) 仅有 0 和 1 的数组不同，而是都是大写字母，所以判断 window 越界的方式会有些不同，解法中维护了一个 vector<int> cnt(26,0) 这样的数组，用于判断是否越界是这样的 **(accumulate(cnt.begin(), cnt.end(), 0) - *max(cnt.begin(),cnt.end())) <= k** 也就是取得把当前数组中最高的那一个留下，然后判断其余的位置和 k 比较。

# solution 

```c++
class Solution {
public:        
    int characterReplacement(string s, int k) {
        int res = 0, l = s.length();
        if (k >= l) return l;
        vector<int> cnt(26,0);
        int ma = 0,start=0;
        for (int i=0;i<l;i++) {
            cnt[s[i]-'A']++;

            ma = max(cnt[s[i]-'A'], ma);
            int sum = accumulate(cnt.begin(), cnt.end(), 0);
            if (sum - ma > k) {
                cnt[s[start++]-'A']--;
                sum--;
            }
            
            res = max(res, ma + min(k, sum-ma));
        }
        return res;
    }
};
//Runtime: 16 ms, faster than 59.08% of C++ online submissions for Longest Repeating Character Replacement.
//Memory Usage: 9.3 MB, less than 50.91% of C++ online submissions for Longest Repeating Character Replacement.
```