# product-of-array-except-self

[https://leetcode.com/problems/product-of-array-except-self/](https://leetcode.com/problems/product-of-array-except-self/)

```
Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

Example:

Input:  [1,2,3,4]
Output: [24,12,8,6]
Note: Please solve it without division and in O(n).

Follow up:
Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
```

# solution

```c++
// O(n) Runtime, O(n) Space.
class Solution {
public:
    vector<int> productExceptSelf(vector<int>& nums) {
        int len = nums.size();
        if (len <= 1) return {1};
        vector<int> res(len, 1);
        vector<int> front(len, 1),back(len, 1);

        front[0] = 1;
        front[1] = nums[0];
        for (int i=2;i<nums.size();i++) {
            front[i] = front[i-1] * nums[i-1];
        }

        back[len-1] = 1;
        back[len-2] = nums[len-1];
        for (int i = len-3;i>=0;i--) {
            back[i] = back[i+1] * nums[i+1];
        }

        for (int i=0;i<len;i++) {
            res[i] = back[i] * front[i];
        }

        return res;
    }
};
//Runtime: 44 ms, faster than 77.97% of C++ online submissions for Product of Array Except Self.
//Memory Usage: 13 MB, less than 22.48% of C++ online submissions for Product of Array Except Self.
```
