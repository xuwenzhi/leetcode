# find-common-characters

[https://leetcode.com/problem/find-common-characters/](https://leetcode.com/problem/find-common-characters/)

```
Given an array A of strings made only from lowercase letters, return a list of all characters that show up in all strings within the list (including duplicates).  For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.

You may return the answer in any order.

 

Example 1:

Input: ["bella","label","roller"]
Output: ["e","l","l"]
Example 2:

Input: ["cool","lock","cook"]
Output: ["c","o"]
 

Note:

1 <= A.length <= 100
1 <= A[i].length <= 100
A[i][j] is a lowercase letter
```

# solution 

```c++
// O(n*26) Runtime, O(1) Space.
// 两个固定26大小的数组
class Solution {
public:
    vector<string> commonChars(vector<string>& A) {
        vector<string> res;
        int l = A.size();
        if (l==0) return res;
        
        int count[26] = {0};
        for (auto i:A[0]) {
            count[i-'a']++;
        }
        
        for (int i=1;i<l;i++) {
            int cnt[26] = {};
            for (auto c:A[i]) {
                cnt[c-'a']++;
            }
            
            for (int j=0;j<26;j++) {
                if (cnt[j] > 0) {
                    count[j] = min(cnt[j], count[j]);
                } else {
                    count[j] = 0;
                }
            }
        }

        for (int i=0;i<26;i++) {
            while (count[i] > 0) {
                res.push_back(string(1, 'a'+i));
                count[i]--;
            }
        }
        
        return res;
    }
};
//Runtime: 12 ms, faster than 89.21% of C++ online submissions for Find Common Characters.
//Memory Usage: 9.4 MB, less than 88.57% of C++ online submissions for Find Common Characters.
```