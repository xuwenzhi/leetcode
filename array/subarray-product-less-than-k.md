# subarray-product-less-than-k

[https://leetcode.com/problems/subarray-product-less-than-k/](https://leetcode.com/problems/subarray-product-less-than-k/)

```
Your are given an array of positive integers nums.

Count and print the number of (contiguous) subarrays where the product of all the elements in the subarray is less than k.

Example 1:

Input: nums = [10, 5, 2, 6], k = 100
Output: 8
Explanation: The 8 subarrays that have product less than 100 are: [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6].
Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.
Note:

0 < nums.length <= 50000.
0 < nums[i] < 1000.
0 <= k < 10^6.
```

# thinking

有点滑动窗口的感觉，从左到右走你，用两个指针i，j 一前一后，

# solution 

```c++
class Solution {
public:
    int numSubarrayProductLessThanK(vector<int>& nums, int k) {
        if (nums.size() <= 0 || k <= 0) return 0;
        int i=0,j=1, res = 0;
        // 先给product搞个默认值
        int product = nums[i];
        if (product < k) res=1;
        while (j < nums.size()) {
            product *= nums[j];
            if (product >= k) {
                // 这里为什么要用个while循环走你呢？因为这时候窗口左边可能已经是很小的数，比如1，1，2这种，product / 窗口左边 不见得会小于 k，所以需要一个while循环
                while (i<j && product >= k) {
                    product /= nums[i++];
                }    
            }
            res += j-i;
            res += nums[j] < k ? 1 : 0; // 这里主要判断当前数是不是小于k
            j++;
        }
        return res;
    }
};
//Runtime: 124 ms, faster than 95.32% of C++ online submissions for Subarray Product Less Than K.
//Memory Usage: 18.2 MB, less than 82.14% of C++ online submissions for Subarray Product Less Than K.
```