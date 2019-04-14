# longest-arithmetic-sequence
[https://leetcode.com/problems/longest-arithmetic-sequence/](https://leetcode.com/problems/longest-arithmetic-sequence/)

```
Given an array A of integers, return the length of the longest arithmetic subsequence in A.

Recall that a subsequence of A is a list A[i_1], A[i_2], ..., A[i_k] with 0 <= i_1 < i_2 < ... < i_k <= A.length - 1, and that a sequence B is arithmetic if B[i+1] - B[i] are all the same value (for 0 <= i < B.length - 1).



Example 1:

Input: [3,6,9,12]
Output: 4
Explanation:
The whole array is an arithmetic sequence with steps of length = 3.
Example 2:

Input: [9,4,7,2,10]
Output: 3
Explanation:
The longest arithmetic subsequence is [4,7,10].
Example 3:

Input: [20,1,15,3,10,5,8]
Output: 4
Explanation:
The longest arithmetic subsequence is [20,15,10,5].


Note:

2 <= A.length <= 2000
0 <= A[i] <= 10000
```

# solution (brute)
```
// O(n^3) Runtime, O(1) Space.
class Solution {
public:
    int longestArithSeqLength(vector<int>& A) {
        int len = A.size();
        if (len <= 2) return len;
        int res = 0;
        for (int i = 0; i < len; i++) {
            for (int j = i + 1; j < len; j++) {
                int gap = A[j] - A[i];
                int tmp = 2;
                int tmp_j = j;
                for (int k = j + 1; k < len; k++) {
                    if (A[k] - A[tmp_j] == gap) {
                        tmp_j = k;
                        tmp++;
                    }
                }

                if (res < tmp) res = tmp;
            }
        }
        return res;
    }
};

```

# solution(dp)

待补充
