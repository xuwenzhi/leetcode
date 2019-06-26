# letter-case-permutation

[https://leetcode.com/problems/letter-case-permutation/](https://leetcode.com/problems/letter-case-permutation/)

```
Given a string S, we can transform every letter individually to be lowercase or uppercase to create another string.  Return a list of all possible strings we could create.

Examples:
Input: S = "a1b2"
Output: ["a1b2", "a1B2", "A1b2", "A1B2"]

Input: S = "3z4"
Output: ["3z4", "3Z4"]

Input: S = "12345"
Output: ["12345"]
Note:

S will be a string with length between 1 and 12.
S will consist only of letters or digits.
```

# solution 

```c++
class Solution {
public:
    vector<string> letterCasePermutation(string S) {        
        vector<string> res;
        permutations(S, S.size()-1, res);
        
        return res;
    }
    
    void permutations(string S, int start, vector<string> &res) {
        res.push_back(S);
        for (int i=start; i>=0; i--) {
            if (!isalpha(S[i])) continue;
            S[i] = S[i] >= 'a' && S[i]<='z' 
                ? S[i] - 32 
                : S[i]+32;
            permutations(S, i-1, res);
            S[i] = S[i] >= 'a' && S[i]<='z' 
                ? S[i] - 32 
                : S[i]+32;
        }
    }
};
//Runtime: 12 ms, faster than 77.18% of C++ online submissions for Letter Case Permutation.
//Memory Usage: 11.9 MB, less than 85.11% of C++ online submissions for Letter Case Permutation.
```