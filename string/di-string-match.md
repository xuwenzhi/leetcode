# di-string-match

[https://leetcode.com/problems/di-string-match/](https://leetcode.com/problems/di-string-match/)

```
Given a string S that only contains "I" (increase) or "D" (decrease), let N = S.length.

Return any permutation A of [0, 1, ..., N] such that for all i = 0, ..., N-1:

If S[i] == "I", then A[i] < A[i+1]
If S[i] == "D", then A[i] > A[i+1]
 

Example 1:

Input: "IDID"
Output: [0,4,1,3,2]
Example 2:

Input: "III"
Output: [0,1,2,3]
Example 3:

Input: "DDI"
Output: [3,2,0,1]
 

Note:

1 <= S.length <= 10000
S only contains characters "I" or "D".
```

# thinking

使用两个指针 **i** 和 **j**

当此时为 'I' 时，也就表示此时应该放个小一点的数，即把 **i** 放在这里，并进行 **i++**

当此时为 'D' 时，也就表示此时应该把大的数放下来，然后把 **j--**

# solution 

```c++
class Solution {
public:
    vector<int> diStringMatch(string S) {
        int i=0,j=S.length();
        int p = 0;
        vector<int> res(S.length()+1);
        for (char c : S) {
            if (c == 'I') {
                res[p] = i++;
            } else {
                res[p] = j--;
            }
            p++;
        }
        res[p] = i;
        
        return res;
    }
};
//Runtime: 40 ms, faster than 71.71% of C++ online submissions for DI String Match.
//Memory Usage: 10 MB, less than 91.67% of C++ online submissions for DI String Match.
```