# find-minimum-in-sorted-array-ii

[https://leetcode.com/problems/find-minimum-in-sorted-array-ii](https://leetcode.com/problems/find-minimum-in-sorted-array-ii)

```
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

Find the minimum element.

The array may contain duplicates.

Example 1:

Input: [1,3,5]
Output: 1
Example 2:

Input: [2,2,2,0,1]
Output: 0
Note:

This is a follow up problem to Find Minimum in Rotated Sorted Array.
Would allow duplicates affect the run-time complexity? How and why?
```

# thinking

For case where AL == AM == AR, the minimum could be on AM’s left or right side (eg, [1, 1, 1, 0, 1] or [1, 0, 1, 1, 1]). 
In this case, we could not discard either subarrays and therefore such worst case degenerates to the order of O(n).

# solution

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int findMin(vector<int>& nums) {
        int len = nums.size();
        if (len == 0) return 0;
        if (len == 1 || nums[0] < nums[len-1]) return nums[0];
        
        int low = 0, high = len-1;
        while (low < high && nums[low] >= nums[high]) {
            int mid = (low + high) / 2;
            if (nums[mid] > nums[high]) {
                low = mid+1;
            } else if(nums[mid] > nums[low]) {
                high = mid;
            } else {
                low++;
            }
        }
        
        return nums[low];
    }
};
//Runtime: 8 ms, faster than 99.41% of C++ online submissions for Find Minimum in Rotated Sorted Array II.
//Memory Usage: 8.8 MB, less than 41.88% of C++ online submissions for Find Minimum in Rotated Sorted Array II.
```
