# longest-palindrome

[https://leetcode.com/problems/longest-palindrome/](https://leetcode.com/problems/longest-palindrome/)


```
Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

 

Example 1:

Input: s = "abccccdd"
Output: 7
Explanation:
One longest palindrome that can be built is "dccaccd", whose length is 7.
Example 2:

Input: s = "a"
Output: 1
Example 3:

Input: s = "bb"
Output: 2
 

Constraints:

1 <= s.length <= 2000
s consists of lowercase and/or uppercase English letters only.
```

# solution

只有偶数个字母能够形成 palindrome，如果有奇数个字母的字母，那么可以放在中间，而且就只能放一个。

```c++
class Solution {
public:
    int longestPalindrome(string s) {
        int count[52] = {0};
        for (auto c: s) {
            if (c >= 'a' && c <= 'z') {
                count[c-'a']++;
            } else {
                count[c-'A' + 26]++;
            }
        }
        
        int ans = 0, single = 0;
        for (int i = 0; i < 52; i++) {
            if (count[i] > 1) {
                ans += count[i] / 2 * 2;
                if (count[i] % 2 == 1) single = 1;
            } else if(count[i] == 1) {
                single = 1;
            }
        }
        
        ans += single;
        return ans;
    }
};
//Runtime: 4 ms, faster than 75.73% of C++ online submissions for Longest Palindrome.
//Memory Usage: 6.5 MB, less than 92.61% of C++ online submissions for Longest Palindrome.
```