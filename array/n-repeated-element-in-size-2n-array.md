# n-repeated-element-in-size-2n-array

[https://leetcode.com/problems/n-repeated-element-in-size-2n-array/](https://leetcode.com/problems/n-repeated-element-in-size-2n-array/)

```
In a array A of size 2N, there are N+1 unique elements, and exactly one of these elements is repeated N times.

Return the element repeated N times.

 

Example 1:

Input: [1,2,3,3]
Output: 3
Example 2:

Input: [2,1,2,5,3,2]
Output: 2
Example 3:

Input: [5,1,5,2,5,3,5,4]
Output: 5
 

Note:

4 <= A.length <= 10000
0 <= A[i] < 10000
A.length is even
```

# thinking

由于是2N大小的数组，并且有N+1都是唯一的，所以仅有目标元素的个数大于1，用一个hashtable存储元素个数，发现如果Hashtable中已经有此元素，则可以直接返回了。

# solution 

```c++
class Solution {
public:
    int repeatedNTimes(vector<int>& A) {
        unordered_map<int, int> m;
        for (auto i : A) {
            if (m[i] > 0) return i;
            m[i]++;
        }
        return 0;
    }
};
//Runtime: 36 ms, faster than 96.32% of C++ online submissions for N-Repeated Element in Size 2N Array.
//Memory Usage: 10.7 MB, less than 36.43% of C++ online submissions for N-Repeated Element in Size 2N Array.
```