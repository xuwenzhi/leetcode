# longest-palindromic-substring

[https://leetcode.com/problems/longest-palindromic-substring/](https://leetcode.com/problems/longest-palindromic-substring/)

```
Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

Example 1:

Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.
Example 2:

Input: "cbbd"
Output: "bb"
```

# solution (normal)

考虑到回文字符串可为奇数和偶数的情况，所以就通过 **s[pivot-gap] = s[pivot+gap]** 这种进行常规解决.

```c++
// O(n^2) Runtime, O(1) Space.
class Solution {
public:
    string longestPalindrome(string s) {
        int len = s.size();
        if (len == 0) return "";
        int resLength = 1;
        string res;
        for (int i = 0;i < len;i++) {
            // for case "xabbay"
            if (i<len-1 && s[i] == s[i+1]) {
                int p=i,q=i+1;
                while (p>=0 && q<len && s[p] == s[q]) {
                    p--;
                    q++;
                }
                p++;q--;
                if (q-p+1 >= resLength) {
                    resLength = q-p+1;
                    res = s.substr(p, q-p+1);
                }
				// dont continue because the case "ccc"
            }

            // for case "xababay"
            int k = 0;
            while (i-k>=0 && i+k < len && s[i-k] == s[i+k]) {
                k++;
            }
            k--;
            if (2*k + 1 >= resLength) {
                res = s.substr(i-k, 2*k+1);
                resLength = 2*k+1;
            }
        }

        return res;
    }
};
//Runtime: 20 ms, faster than 81.28% of C++ online submissions for Longest Palindromic Substring.
//Memory Usage: 12.3 MB, less than 54.79% of C++ online submissions for Longest Palindromic Substring.
```

# solution (dynamic programing)

使用dp解决，新建dp二维数组，但实际上只用到一半空间。见下方代码case吧。

```c++
// O(n^2) Runtime, O(n^2) Space.
class Solution {
public:
    string longestPalindrome(string s) {
        int len = s.size();
        if (len == 0) return "";
        string res = "";
        bool dp[len][len] = {false};
        for (int i=0;i<len;i++) {
            dp[i][i] = true;
            if (i == len-1) break;
            dp[i][i+1] = (s[i] == s[i+1]);
        }
        //case "cbbba"
        /**
        1 0 0 0 0
          1 1 0 0
            1 1 0
              1 0
                1
        */
        for(int i = len-3; i>=0; --i){
            for(int j = i+2;j<len; ++j){
                dp[i][j] = (dp[i+1][j-1] && s[i]==s[j]);
            }
        }
        /**
        1 0 0 0 0
          1 1 1 0
            1 1 0
              1 0
                1
        */
        //get maxstr result
        int max = 0;
        string maxstr = "";
        for(int i=0;i<len;i++){
            for(int j=i;j<len;j++){
                if(dp[i][j]==true and j-i+1>=max){
                    max = j-i+1;
                    maxstr = s.substr(i,j-i+1);
                }
            }
        }
        return maxstr;
    }
};
//Runtime: 140 ms, faster than 36.15% of C++ online submissions for Longest Palindromic Substring.
//Memory Usage: 16.9 MB, less than 44.17% of C++ online submissions for Longest Palindromic Substring.
```

reference:[Direct c++ DP](https://leetcode.com/problems/longest-palindromic-substring/discuss/147548/)

# solution (O(n) Runtime, O(n) Space.  Manacher's algorithm)

弄了好久才想明白，嗯，看图吧~

图中，为啥在构造**t**的时候要在前面加一个**$**见 [Manacher's Algorithm 马拉车算法](https://www.cnblogs.com/grandyang/p/4475985.html)

> "bob"，"o" 在 "#b#o#b#" 中的位置是3，但是半径是4，这一减成负的了，肯定不对。所以我们应该至少把中心位置向后移动一位，才能为0啊，那么我们就需要在前面增加一个字符，这个字符不能是#号，也不能是s中可能出现的字符，所以我们暂且就用美元号吧，毕竟是博主最爱的东西嘛。

![https://github.com/xuwenzhi/leetcode/raw/master/images/manachers-algorithm.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/manachers-algorithm.jpg)

```c++
// O(n) Runtime, O(n) Space.
class Solution {
public:
    string longestPalindrome(string s) {
        int len = s.size();
        if (len == 0) return "";

        string t = "$#";
        for (int i = 0;i<len;i++) {
            t += s[i];
            t += "#";
        }
        int tLen = t.size();
        vector<int> P(tLen, 0);
        int id = 0, mx = 0, resCenter, resLen = 0;
        for (int i=1;i<tLen;i++) {
            P[i] = mx > i ? min(P[2 * id - i], mx - i) : 1;
            while (t[i+P[i]] == t[i-P[i]]) ++P[i];

            if (mx < i + P[i]) {
                mx = i + P[i];
                id = i;
            }

            if (resLen < P[i]) {
                resLen = P[i];
                resCenter = i;
            }
        }

        return s.substr((resCenter-resLen)/2, resLen - 1);
    }
};
//Runtime: 8 ms, faster than 96.75% of C++ online submissions for Longest Palindromic Substring.
//Memory Usage: 9.6 MB, less than 66.12% of C++ online submissions for Longest Palindromic Substring.
```

reference: [Manacher's Algorithm 马拉车算法](http://www.cnblogs.com/grandyang/p/4475985.html)

# solution (回文树)

这个是14年才出现的一种新数据结构，对于判定回文串，以及最长子回文串以及统计回文串数量都比较有用。

具体这里先不展开了，可以看这篇文章[Palindromic Tree | Introduction & Implementation](https://www.geeksforgeeks.org/palindromic-tree-introduction-implementation/)
