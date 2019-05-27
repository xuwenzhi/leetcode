# previous-permutation-with-one-swap

[https://leetcode.com/problems/previous-permutation-with-one-swap/](https://leetcode.com/problems/previous-permutation-with-one-swap/)

```
Given an array A of positive integers (not necessarily distinct), return the lexicographically largest permutation that is smaller than A, that can be made with one swap (A swap exchanges the positions of two numbers A[i] and A[j]).  If it cannot be done, then return the same array.

 

Example 1:

Input: [3,2,1]
Output: [3,1,2]
Explanation: Swapping 2 and 1.
Example 2:

Input: [1,1,5]
Output: [1,1,5]
Explanation: This is already the smallest permutation.
Example 3:

Input: [1,9,4,6,7]
Output: [1,7,4,6,9]
Explanation: Swapping 9 and 7.
Example 4:

Input: [3,1,1,3]
Output: [1,3,1,3]
Explanation: Swapping 1 and 3.
 

Note:

1 <= A.length <= 10000
1 <= A[i] <= 10000
```

# thinking

这道题是2019.5.26(Weekly Contest 138)的Contest，不过出现了个小插曲，具体插曲可以看当时Discuss，不过很尴尬的是，当时我还通过了所有的case，而且当时还没发现[尴尬脸]

这个题其实有点类似 **prev_permutations** ，题目和[next-permutation](https://github.com/xuwenzhi/leetcode/blob/master/array/next-permutation.md)，而且解法也差不多.


```c++
class Solution {
public:
    vector<int> prevPermOpt1(vector<int>& A) {
        int l = A.size();
        if (l <= 1) return A;

        int i = l - 2;
        while (i >= 0 && A[i] <= A[i+1]) i--;

        if (i < 0) {
            return A;
        }
        int j = l-1;
        while (j > 1 && A[j] >= A[i] || A[j] == A[j-1]) j--;
        swap(A[j], A[i]);
        
        return A;
    }
};
//Runtime: 112 ms, faster than 66.24% of C++ online submissions for Previous Permutation With One Swap.
//Memory Usage: 12.8 MB, less than 100.00% of C++ online submissions for Previous Permutation With One Swap.
```