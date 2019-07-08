# custom-sort-string

[https://leetcode.com/problems/custom-sort-string/](https://leetcode.com/problems/custom-sort-string/)

```
S and T are strings composed of lowercase letters. In S, no letter occurs more than once.

S was sorted in some custom order previously. We want to permute the characters of T so that they match the order that S was sorted. More specifically, if x occurs before y in S, then x should occur before y in the returned string.

Return any permutation of T (as a string) that satisfies this property.

Example :
Input: 
S = "cba"
T = "abcd"
Output: "cbad"
Explanation: 
"a", "b", "c" appear in S, so the order of "a", "b", "c" should be "c", "b", and "a". 
Since "d" does not appear in S, it can be at any position in T. "dcba", "cdba", "cbda" are also valid outputs.
 

Note:

S has length at most 26, and no character is repeated in S.
T has length at most 200.
S and T consist of lowercase letters only.
```

# thinking

使用26大小的数组存储T中字母出现的次数，然后首先遍历S，处理出来需要排序的字母们，然后再遍历26大小的数组，将值>0的字母，搞出来就完事了。

# solution 

```c++
class Solution {
public:
    string customSortString(string S, string T) {
        int counter[26] = {0};
        for (char c : T) {
            counter[c-'a']++;
        }
        
        string res;
        for (char i : S) {
            if (counter[i-'a'] > 0) {
                for (int j=0;j<counter[i-'a'];j++) {
                    res += i;
                }
                counter[i-'a'] = 0;
            }
        }
        
        for (int i=0;i<26;i++) {
            if (counter[i] > 0) {
                for (int j=0;j<counter[i];j++)
                    res += i+'a';
            }
        }
        
        return res;
    }
};
//Runtime: 4 ms, faster than 76.58% of C++ online submissions for Custom Sort String.
//Memory Usage: 8.5 MB, less than 48.56% of C++ online submissions for Custom Sort String.
```