# find-minimum-in-rotated-sorted-array

[https://leetcode.com/problems/find-minimum-in-rotated-sorted-array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array)

```
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

Find the minimum element.

You may assume no duplicate exists in the array.

Example 1:

Input: [3,4,5,1,2] 
Output: 1
Example 2:

Input: [4,5,6,7,0,1,2]
Output: 0
```

# thinking

我的解决方案是从左和右两边分别向另一个方向进发，当发现后一个值小于前一个值时，就得到结果了。

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
        while (low < high) {
            if (nums[low] < nums[low+1]) {
                low++;
            } else {
                return nums[low+1];
            }
            if (nums[high] > nums[high-1]) {
                high--;
            } else {
                return nums[high];
            }
        }
        
        return 0;
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Find Minimum in Rotated Sorted Array.
//Memory Usage: 8.8 MB, less than 17.69% of C++ online submissions for Find Minimum in Rotated Sorted Array.
```

# rethinking

另外还有一种办法，就是如果使用二分的方法，对这个数组分成两段，其中一段必然是排序的，而另一段存在着结果，所以也可以通过下面的办法解决。

# solution

```c++
class Solution {
public:
    int findMin(vector<int>& nums) {
        int len = nums.size();
        if (len == 0) return 0;
        if (len == 1 || nums[0] < nums[len-1]) return nums[0];
        
        int low = 0, high = len-1;
        while (low < high && nums[low] > nums[high]) {
            int mid = (low + high) / 2;
            if (nums[mid] >= nums[low]) {
                low++;
            } else {
                high = mid;
            }
        }
        
        return nums[low];
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Find Minimum in Rotated Sorted Array.
//Memory Usage: 8.8 MB, less than 22.19% of C++ online submissions for Find Minimum in Rotated Sorted Array.
```

