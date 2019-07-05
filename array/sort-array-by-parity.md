# sort-array-by-parity

[https://leetcode.com/problems/sort-array-by-parity/](https://leetcode.com/problems/sort-array-by-parity/)

```
Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

You may return any answer array that satisfies this condition.

 

Example 1:

Input: [3,1,2,4]
Output: [2,4,3,1]
The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
 

Note:

1 <= A.length <= 5000
0 <= A[i] <= 5000

```

# solution 

```c++
class Solution {
public:
    vector<int> sortArrayByParity(vector<int>& A) {
        vector<int> even, odd;
        int l=A.size();
        for (int i=0;i<l;i++) {
            if (A[i] % 2 == 0) {
                even.push_back(A[i]);
            } else {
                odd.push_back(A[i]);
            }
        }
        vector<int> res = even;
        res.insert( res.end(), odd.begin(), odd.end() );
        
        return res;
    }
};
//Runtime: 28 ms, faster than 84.36% of C++ online submissions for Sort Array By Parity.
//Memory Usage: 10.4 MB, less than 5.05% of C++ online submissions for Sort Array By Parity.
```