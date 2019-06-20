# max-consecutive-ones

[https://leetcode.com/problems/max-consecutive-ones/](https://leetcode.com/problems/max-consecutive-ones/)

```
Given a binary array, find the maximum number of consecutive 1s in this array.

Example 1:

Input: [1,1,0,1,1,1]
Output: 3
Explanation: The first two digits or the last three digits are consecutive 1s.
    The maximum number of consecutive 1s is 3.
Note:

The input array will only contain 0 and 1.
The length of input array is a positive integer and will not exceed 10,000
```
# solution 

```c++
class Solution {
public:
    int findMaxConsecutiveOnes(vector<int>& nums) {
        int res = 0;
        
        int tmp = 0;
        for (int i=0;i<nums.size();i++) {
            if (nums[i] == 0 || i == nums.size()-1) {
                res = max(res, tmp + nums[i]);
                tmp = 0;
            } else {
                tmp++;
            }
        }
        
        return res;
    }
};
//Runtime: 36 ms, faster than 91.60% of C++ online submissions for Max Consecutive Ones.
//Memory Usage: 11.7 MB, less than 74.74% of C++ online submissions for Max Consecutive Ones.
```