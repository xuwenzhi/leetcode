# search-in-rotated-sorted-array

[https://leetcode.com/problems/search-in-rotated-sorted-array/](https://leetcode.com/problems/search-in-rotated-sorted-array/)

# My Solution (betas 100% golang submission)

# Thinking

1. The array maybe an sorted array from start to end.
2. The Left numbers must be biger than right numbers.

O(LogN)

```golang
func search(nums []int, target int) int {
    if (len(nums) == 0) {
        return -1
    } 
    var low = 0;
    var high = len(nums) - 1
    var min int
    for low <= high {
        min = (low + high) / 2
        
        if (nums[min] == target) {
            return min
        }
        if (nums[low] < nums[high]) {
            if (target < nums[min]) {
                high = min - 1
            } else {
                low = min + 1
            }
        } else {
            if (nums[min] == nums[low]) {
                low = min + 1
                continue
            }
            if nums[min] > nums[low] {
                if (target < nums[min] && target >= nums[low]) {
                    high = min - 1
                } else {
                    low = min + 1
                }
            } else {
                if (target > nums[min] && target <= nums[high]) {
                    low = min + 1
                } else {
                    high = min - 1
                }
            }
        }
    }
    
    return -1
}
```
