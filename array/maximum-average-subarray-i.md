# maximum-average-subarray-i

[https://leetcode.com/problems/maximum-average-subarray-i/](https://leetcode.com/problems/maximum-average-subarray-i/)

```
Given an array consisting of n integers, find the contiguous subarray of given length k that has the maximum average value. And you need to output the maximum average value.

Example 1:

Input: [1,12,-5,-6,50,3], k = 4
Output: 12.75
Explanation: Maximum average is (12-5-6+50)/4 = 51/4 = 12.75
 

Note:

1 <= k <= n <= 30,000.
Elements of the given array will be in the range [-10,000, 10,000].
```

# solution (sliding window)

```c++
class Solution {
public:
    double findMaxAverage(vector<int>& nums, int k) {
        double res = INT_MIN;
        int sum = accumulate(nums.begin(), nums.begin()+k-1, 0), start = 0;
        for (int i=k-1;i<nums.size();i++) {
            sum += nums[i];
            if (i-start >= k) {
                sum -= nums[i-k];
                start++;
            }
            res = max(res, (double)sum/k);
        }
        
        return res;
    }
};
//Runtime: 176 ms, faster than 53.72% of C++ online submissions for Maximum Average Subarray I.
//Memory Usage: 16.7 MB, less than 100.00% of C++ online submissions for Maximum Average Subarray I.
```