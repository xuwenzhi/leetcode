# shortest-unsorted-continuous-subarray

[https://leetcode.com/problems/shortest-unsorted-continuous-subarray/](https://leetcode.com/problems/shortest-unsorted-continuous-subarray/)

```
Given an integer array, you need to find one continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order, too.

You need to find the shortest such subarray and output its length.

Example 1:

Input: [2, 6, 4, 8, 10, 9, 15]
Output: 5
Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.
Note:

Then length of the input array is in range [1, 10,000].
The input array may contain duplicates, so ascending order here means <=.
```

# solution (sort)

新创建一个nums的已排序的数组，然后两个数组进行比较即可。

```c++
class Solution {
public:
    int findUnsortedSubarray(vector<int>& nums) {
        int l = nums.size();
        vector<int> t = nums;
        sort(t.begin(), t.end());
        
        int start=0, end=0;
        for (int i=0;i<l;i++) {
            if (nums[i] != t[i]) {
                start = i;
                break;
            }
        }
        for (int i=l-1;i>=0;i--) {
            if (nums[i] != t[i]) {
                end = i;
                break;
            }
        }
        
        return (start == end) ? 0 : end-start+1;
    }
};
//Runtime: 48 ms, faster than 48.69% of C++ online submissions for Shortest Unsorted Continuous Subarray.
//Memory Usage: 11.4 MB, less than 61.70% of C++ online submissions for Shortest Unsorted Continuous Subarray.
```

# solution (double vector)

> From the left, for a number to stay untouched, there need to be no number less than it on the right hand side;
From the right, for a number to stay untouched, there need to be no number greater than it on the left hand side;

使用两个vector，存储数组当前位置的最小值或最大值。

```c++
/**
 *            /------------\
 * nums:  [2, 6, 4, 8, 10, 9, 15]
 * ----------------------------------------
 * minr:   2  4  4  8   9  9  15
 *         <--------------------
 * maxl:   2  6  6  8  10 10  15
 *         -------------------->
 */
class Solution {
public:
    int findUnsortedSubarray(vector<int>& nums) {
        int n = nums.size();
        vector<int> maxlhs(n);   // max number from left to cur
        vector<int> minrhs(n);   // min number from right to cur
        for (int i = n - 1,minr = INT_MAX; i >= 0; i--) minrhs[i] = minr = min(minr, nums[i]);
        for (int i = 0,maxl = INT_MIN; i < n;  i++) maxlhs[i] = maxl = max(maxl, nums[i]);

        int i = 0, j = n - 1;
        while (i < n && nums[i] <= minrhs[i]) i++;
        while (j > i && nums[j] >= maxlhs[j]) j--;

        return j + 1 - i;
    }
};
```


# refer

[[C++] Clean Code 2 Solution - Sort O(NlgN) & max min vectors O(N)](https://leetcode.com/problems/shortest-unsorted-continuous-subarray/discuss/103062/)