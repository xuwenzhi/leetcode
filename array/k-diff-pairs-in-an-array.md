# k-diff-pairs-in-an-array

[https://leetcode.com/problems/k-diff-pairs-in-an-array/](https://leetcode.com/problems/k-diff-pairs-in-an-array/)

```
Given an array of integers and an integer k, you need to find the number of unique k-diff pairs in the array. Here a k-diff pair is defined as an integer pair (i, j), where i and j are both numbers in the array and their absolute difference is k.

Example 1:

Input: [3, 1, 4, 1, 5], k = 2
Output: 2
Explanation: There are two 2-diff pairs in the array, (1, 3) and (3, 5).
Although we have two 1s in the input, we should only return the number of unique pairs.
Example 2:

Input:[1, 2, 3, 4, 5], k = 1
Output: 4
Explanation: There are four 1-diff pairs in the array, (1, 2), (2, 3), (3, 4) and (4, 5).
Example 3:

Input: [1, 3, 1, 5, 4], k = 0
Output: 1
Explanation: There is one 0-diff pair in the array, (1, 1).
Note:

The pairs (i, j) and (j, i) count as the same pair.
The length of the array won't exceed 10,000.
All the integers in the given input belong to the range: [-1e7, 1e7].
```

# thinking

case真是有毒，既然都已经说k是absolute differrence了，竟然还带负数？赶忙踩一脚。这道题主要是用hashtable存储一下数字出现的次数，如果k=0的话，只要自身出现的次数大于1就存在这一个结果，多了没有。如果k>0的话，计算是否存在m[i-k] 和 m[i+k] 就完了。

# solution 

```c++
class Solution {
private:
    unordered_map<int, int> m;
public:
    int findPairs(vector<int>& nums, int k) {
        if (k < 0) return 0;
        for (auto i:nums) {
            m[i]++;
        }
        
        int res = 0;
        for (auto i:nums) {
            if (m[i] < 1) continue;
            if (k != 0) {
                if (m[i-k]) {
                    res++;
                }
                if (m[i+k]) {
                    res++;
                }
            } else {
                if (m[i] > 1) {
                    res++;
                }
            }
            m[i] = 0;
        }
        
        return res;
    }
};
//Runtime: 32 ms, faster than 87.26% of C++ online submissions for K-diff Pairs in an Array.
//Memory Usage: 13.1 MB, less than 32.44% of C++ online submissions for K-diff Pairs in an Array.
```