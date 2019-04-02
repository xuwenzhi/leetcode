# array-nesting

[https://leetcode.com/problems/array-nesting/](https://leetcode.com/problems/array-nesting/)

```
A zero-indexed array A of length N contains all integers from 0 to N-1. Find and return the longest length of set S, where S[i] = {A[i], A[A[i]], A[A[A[i]]], ... } subjected to the rule below.

Suppose the first element in S starts with the selection of element A[i] of index = i, the next element in S should be A[A[i]], and then A[A[A[i]]]… By that analogy, we stop adding right before a duplicate element occurs in S.



Example 1:

Input: A = [5,4,0,3,1,6,2]
Output: 4
Explanation:
A[0] = 5, A[1] = 4, A[2] = 0, A[3] = 3, A[4] = 1, A[5] = 6, A[6] = 2.

One of the longest S[K]:
S[0] = {A[0], A[5], A[6], A[2]} = {5, 6, 2, 0}


Note:

N is an integer within the range [1, 20,000].
The elements of A are all distinct.
Each element of A is an integer within the range [0, N-1].
```

# thinking

这又是一个成环的问题，和[[medium]find-the-duplicate-number - 寻找数组的重复数](https://github.com/xuwenzhi/leetcode/blob/master/array/find-the-duplicate-number.md)类似，寻找重复数是用环来解决问题。这个问题是求得所有的环，返回最大的环。

![https://github.com/xuwenzhi/leetcode/raw/master/images/array-nesting.jpeg](https://github.com/xuwenzhi/leetcode/raw/master/images/array-nesting.jpeg)

通过此图可以大致了解到，一些固定元素会成环，也就是在这些节点上计算结果一致，那也就是说可以通过一个map用于保存这些已经经过的节点，就不需要要再次计算了。

# solution

```c++
class Solution {
public:
    int arrayNesting(vector<int>& nums) {
        int res = 0;
        unordered_map<int, int>map;
        int len = nums.size();
        for (int i = 0; i < len; i++) {
            if (map[nums[i]] == -1) continue;
            int j = i;
            int tmp = 1;
            while (nums[j] != i) {
                tmp++;
                j = nums[j];
                map[nums[j]] = -1;
            }
            res = max(res, tmp);
        }

        return res;
    }
};
```

Runtime: 40 ms, faster than 34.74% of C++ online submissions for Array Nesting.

Memory Usage: 14.4 MB, less than 95.06% of C++ online submissions for Array Nesting.
