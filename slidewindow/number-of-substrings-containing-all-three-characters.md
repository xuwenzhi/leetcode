# number-of-substrings-containing-all-three-characters

[https://leetcode.com/problems/number-of-substrings-containing-all-three-characters/](https://leetcode.com/problems/number-of-substrings-containing-all-three-characters/)

```
Given a string s consisting only of characters a, b and c.

Return the number of substrings containing at least one occurrence of all these characters a, b and c.



 Example 1:

 Input: s = "abcabc"
 Output: 10
 Explanation: The substrings containing at least one occurrence of the characters a, b and c are "abc", "abca", "abcab", "abcabc", "bca", "bcab", "bcabc", "cab", "cabc" and "abc" (again).
 Example 2:

 Input: s = "aaacb"
 Output: 3
 Explanation: The substrings containing at least one occurrence of the characters a, b and c are "aaacb", "aacb" and "acb".
 Example 3:

 Input: s = "abc"
 Output: 1


  Constraints:

  3 <= s.length <= 5 x 10^4
  s only consists of a, b or c characters.
```

# thinking

这个题思路一看就是用 **slide window** 解决了，所以就用两个双指针 **i** 和 **j**，然后一个 **vector<int>** 用于存储 **a 、b 、c** 三个字母出现的次数即可。

但还要注意几个点.

case1 "aabbabbaaaaabbbbc"

这种case，也就是j 已经到达末尾，才形成满足条件子串，所以条件里面是使用 **j <= l**

case2 "abcabc"

这种是属于正常可以想到的case，这种流程就是

1. window = {1, 0, 0} i = 0, j = 1
2. window = {1, 1, 0} i = 0, j = 2
3. window = {1, 1, 1} i = 0, j = 3  此时已形成满足条件的子串，那么前进i，想想这样的case **aaabcabc**，这就是需要 **前进i 的理由**。

# solution

```c++
class Solution {
public:
    bool isFull(vector<int> &window) {
        return window[0] > 0 && window[1] > 0 && window[2] > 0;
    }

    int numberOfSubstrings(string s) {
        vector<int> window(3);
        int res = 0, l = s.length();
        int i= 0, j = 0;

        while (j <= l) {
            if (isFull(window)) {
                res += j == l ? 1 : l - j + 1;
                window[s[i] - 'a']--;
                i++; // 如果 j 到当前位置已经形成了一个子串，那么前进 i
            } else {
                if (j == l) break;
                window[s[j] - 'a']++;
                j++; // 如果当前位置已经形成不了满足条件的子串，那么前进 j
            }
        }

        return res;
    }
};
//Runtime: 28 ms, faster than 60.05% of C++ online submissions for Number of Substrings Containing All Three Characters.
//Memory Usage: 9.7 MB, less than 100.00% of C++ online submissions for Number of Substrings Containing All Three Characters.
```
