# find-k-length-substrings-with-no-repeated-characters

[https://leetcode.com/problems/find-k-length-substrings-with-no-repeated-characters/](https://leetcode.com/problems/find-k-length-substrings-with-no-repeated-characters/)

```
Given a string S, return the number of substrings of length K with no repeated characters.



Example 1:

Input: S = "havefunonleetcode", K = 5
Output: 6
Explanation:
There are 6 substrings they are : 'havef','avefu','vefun','efuno','etcod','tcode'.
Example 2:

Input: S = "home", K = 5
Output: 0
Explanation:
Notice K can be larger than the length of S. In this case is not possible to find any substring.


Note:

1 <= S.length <= 10^4
All characters of S are lowercase English letters.
1 <= K <= 10^4
```

# thinking

直接 **slide window** 搞就完事了。

# solution

```c++
class Solution {
public:
    bool isRepeated(int count[]) {
        for (int i=0;i<26;i++) {
            if (count[i] > 1)
                return false;
        }
        return true;
    }

    int numKLenSubstrNoRepeats(string S, int K) {
        int l = S.length();
        if (l < K) return 0;
        int count[26] = {0};
        int i = 0, j = 0, res = 0;
        while (j < l) {
            count[S[j]-'a']++;
            if (j - i + 1 >= K) {
                if (isRepeated(count)) {
                    res++;
                }
                count[S[i]-'a']--;
                i++;
            }
            j++;
        }

        return res;
    }
};
//Runtime: 4 ms, faster than 94.34% of C++ online submissions for Find K-Length Substrings With No Repeated Characters.
//Memory Usage: 7.9 MB, less than 100.00% of C++ online submissions for Find K-Length Substrings With No Repeated Characters.
```
