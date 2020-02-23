# two-sum-less-than-k

[https://leetcode.com/problems/two-sum-less-than-k/](https://leetcode.com/problems/two-sum-less-than-k/)

```
Given an array A of integers and integer K, return the maximum S such that there exists i < j with A[i] + A[j] = S and S < K. If no i, j exist satisfying this equation, return -1.



Example 1:

Input: A = [34,23,1,24,75,33,54,8], K = 60
Output: 58
Explanation:
We can use 34 and 24 to sum 58 which is less than 60.
Example 2:

Input: A = [10,20,30], K = 15
Output: -1
Explanation:
In this case it's not possible to get a pair sum less that 15.


Note:

1 <= A.length <= 100
1 <= A[i] <= 1000
1 <= K <= 2000
```

# thinking

这道题下意识的想到可以用二分法来做，但是也不是全然的二分法，既然有二分了，那么首先需要排序

1. 题目中 **A.length <= 100** 所以数据规模很小，直接排序即可。
2. 其次我们需要求取最大的小于 **K** 的和，那么两个指针 **i** 和 **j** 需要从数组最右侧开始走起，**有点类似插入排序的意味**。
3. 不过这里有个 tricky 地方在于，可以在每次循环中首先判断 **A[0]+A[j]** 是否大于 **K**，如果在这种层面都大于K的话，证明 **A[j] 过大了，没有可能的结果出现在这里。

# solution

```c++
class Solution {
public:
    int twoSumLessThanK(vector<int>& A, int K) {
        int l = A.size();
        if (l <= 1) return -1;
        sort(A.begin(), A.end());
        int j = l-1, i = l-2, result = -1;
        while (j >= 1) {
            if (A[0] + A[j] >= K) {
                j--;
                i = j-1;
                continue;
            }
            while (A[i] + A[j] >= K) {
                i--;
            }
            result = max(result, A[i] + A[j]);
            j--;
            i = j-1;
        }

        return result;
    }
};
//Runtime: 4 ms, faster than 87.31% of C++ online submissions for Two Sum Less Than K.
//Memory Usage: 8.5 MB, less than 40.00% of C++ online submissions for Two Sum Less Than K.
```
