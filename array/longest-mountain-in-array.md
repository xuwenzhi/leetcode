# longest-mountain-in-array

[https://leetcode.com/problems/longest-mountain-in-array/](https://leetcode.com/problems/longest-mountain-in-array/)

```
Let's call any (contiguous) subarray B (of A) a mountain if the following properties hold:

B.length >= 3
There exists some 0 < i < B.length - 1 such that B[0] < B[1] < ... B[i-1] < B[i] > B[i+1] > ... > B[B.length - 1]
(Note that B could be any subarray of A, including the entire array A.)

Given an array A of integers, return the length of the longest mountain. 

Return 0 if there is no mountain.

Example 1:

Input: [2,1,4,7,3,2,5]
Output: 5
Explanation: The largest mountain is [1,4,7,3,2] which has length 5.
Example 2:

Input: [2,2,2]
Output: 0
Explanation: There is no mountain.
Note:

0 <= A.length <= 10000
0 <= A[i] <= 10000
Follow up:

Can you solve it using only one pass?
Can you solve it in O(1) space?
```

# solution 

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int longestMountain(vector<int>& A) {
        int res = 0;
        if (A.size() < 3) return 0;
        int left = 0, right = 0;
        if (A[1] > A[0]) 
            left = 1;
        else if (A[1] < A[0])
            right = 1;
        
        for (int i=1;i<A.size();i++) {
            if (A[i] == A[i-1]) {
                left  = 0;
                right = 0;
                if (i < A.size()-1 && A[i] < A[i+1]) {
                    left = 1;
                }
            } else if (A[i] < A[i-1]) {
                right++;
            } else {
                left++;
            }
            
            // [3,3,1] 这种，不能把第二个3的位置搞成1，还要判断A[1] < A[2]
            if (A[i] < A[i-1]) {
                if (left && right)
                    res = max(res, left+right);
                if (i < A.size()-1 && A[i] < A[i+1]) {
                    left = 1;
                    right = 0;   
                }
            }
        }
        if (left && right)
            res = max(res, left + right);
        return res;
    }
};
//Runtime: 20 ms, faster than 95.80% of C++ online submissions for Longest Mountain in Array.
//Memory Usage: 10 MB, less than 45.43% of C++ online submissions for Longest Mountain in Array.
```