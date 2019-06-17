# sort-array-by-parity-ii

[https://leetcode.com/problems/sort-array-by-parity-ii/](https://leetcode.com/problems/sort-array-by-parity-ii/)

```
Given an array A of non-negative integers, half of the integers in A are odd, and half of the integers are even.

Sort the array so that whenever A[i] is odd, i is odd; and whenever A[i] is even, i is even.

You may return any answer array that satisfies this condition.

 

Example 1:

Input: [4,2,5,7]
Output: [4,5,2,7]
Explanation: [4,7,2,5], [2,5,4,7], [2,7,4,5] would also have been accepted.
 

Note:

2 <= A.length <= 20000
A.length % 2 == 0
0 <= A[i] <= 1000
```

# solution (2 pointer)

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    vector<int> sortArrayByParityII(vector<int>& A) {
        int l = A.size();
        vector<int> res(l);
        int i=0,j=0,k=0;
        while (k < l && (i < l || j < l)) {
            if (k % 2 == 0) {
                while (i < l && A[i] % 2 != 0) i++;
                if (i < l)
                    res[k++] = A[i];
                i++;
            } else {
                while (j < l && A[j] % 2 == 0) j++;
                if (j < l)
                    res[k++] = A[j];
                j++;
            }
        }
        
        return res;
    }
};
//Runtime: 84 ms, faster than 86.58% of C++ online submissions for Sort Array By Parity II.
//Memory Usage: 12 MB, less than 43.19% of C++ online submissions for Sort Array By Parity II.
```