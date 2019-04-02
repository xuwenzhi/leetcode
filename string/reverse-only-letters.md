# reverse-only-letters

[https://leetcode.com/problems/reverse-only-letters/](https://leetcode.com/problems/reverse-only-letters/)

```
Given a string S, return the "reversed" string where all characters that are not a letter stay in the same place, and all letters reverse their positions.

Example 1:

Input: "ab-cd"
Output: "dc-ba"
Example 2:

Input: "a-bC-dEf-ghIj"
Output: "j-Ih-gfE-dCba"
Example 3:

Input: "Test1ng-Leet=code-Q!"
Output: "Qedo1ct-eeLg=ntse-T!"


Note:

S.length <= 100
33 <= S[i].ASCIIcode <= 122
S doesn't contain \ or "
```

# thinking

同时从头至尾互换就完事了,加一个判断是否是letter的方法就行，主要是注意一下这个串有可能全都不是letter.

# solution

```
class Solution {
public:
    bool isLetter(char c) {
        if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
            return true;
        }
        return false;
    }

    string reverseOnlyLetters(string S) {
        int high = S.size() - 1, low = 0;
        while (low < high) {
            while(low < high && !isLetter(S[low])) {
                low++;
            }
            if (low >= high) break;
            while(!isLetter(S[high])) {
                high--;
            }

            swap(S[low++], S[high--]);
        }

        return S;
    }
};
```


Success

Details

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Reverse Only Letters.

Memory Usage: 8.2 MB, less than 100.00% of C++ online submissions for Reverse Only Letters.
