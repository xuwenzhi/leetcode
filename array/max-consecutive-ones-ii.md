# max-consecutive-ones-ii

[https://leetcode.com/problems/max-consecutive-ones-ii/](https://leetcode.com/problems/max-consecutive-ones-ii/)

```
Given a binary array, find the maximum number of consecutive 1s in this array if you can flip at most one 0.

Example 1:

Input: [1,0,1,1,0]
Output: 4
Explanation: Flip the first zero will get the the maximum number of consecutive 1s.
    After flipping, the maximum number of consecutive 1s is 4.
Note:

The input array will only contain 0 and 1.
The length of input array is a positive integer and will not exceed 10,000
Follow up:
What if the input numbers come in one by one as an infinite stream? In other words, you can't store all numbers coming from the stream as it's too large to hold in memory. Could you solve it efficiently?
```

# solution 

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int findMaxConsecutiveOnes(vector<int>& nums) {
        int flip = -1;
        int res = 0, tmp = 0;
        for (int i=0;i<nums.size();i++) {
            if (nums[i] == 0) {
                if (flip == -1) {
                    flip = i;
                    tmp++;
                } else {
                    res = max(res, tmp);
                    tmp = i-flip;
                    flip = i;
                }
            } else {
                tmp++;
            }
        }
        res = max(res, tmp);
        return res;
    }
};
//Runtime: 36 ms, faster than 94.18% of C++ online submissions for Max Consecutive Ones II.
//Memory Usage: 11.7 MB, less than 78.20% of C++ online submissions for Max Consecutive Ones II.
```