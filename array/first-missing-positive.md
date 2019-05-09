# first-missing-positive

[https://leetcode.com/problems/first-missing-positive/](https://leetcode.com/problems/first-missing-positive/)

```
Given an unsorted integer array, find the smallest missing positive integer.

Example 1:

Input: [1,2,0]
Output: 3
Example 2:

Input: [3,4,-1,1]
Output: 2
Example 3:

Input: [7,8,9,11,12]
Output: 1
Note:

Your algorithm should run in O(n) time and uses constant extra space.
```

# solution

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int firstMissingPositive(vector<int>& nums) {
        int l=nums.size();
        for (int i=0;i<l;i++){
            if (nums[i]-1 >= 0 && nums[i] <= l
			    && nums[i] != nums[nums[i]-1]) { // nums[i] != nums[nums[i]-1] avoid duplicate nums, for case [1,2,2,3]
                swap(nums[i], nums[nums[i]-1]);
                if (nums[i]-1 >= 0 && nums[i] <= l
				    && nums[i] != i+1) i--; // if isn't valid swap, then continue swap here.
            }
        }

        int res = 1;
        for (int i=0;i<l;i++){
            if (nums[i] != i+1) {
                return i+1;
            }
        }

        return l+1;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for First Missing Positive.
//Memory Usage: 8.7 MB, less than 99.71% of C++ online submissions for First Missing Positive.
```
