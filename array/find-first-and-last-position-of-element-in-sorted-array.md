# find-first-and-last-position-of-element-in-sorted-array

[https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array)

# My solution

```golang
func searchRange(nums []int, target int) []int {
    var start, end, min int
	var low = 0
	var high = len(nums) - 1
	var i, j int
	if high == -1 {
		return []int{-1, -1}
	}
	for low <= high {
		min = (low + high) / 2
		if nums[min] == target {
			break
		} else if nums[min] > target {
			high = min - 1
		} else {
			low = min + 1
		}
	}

	if nums[min] == target {
        start, end = min, min
        for i = min - 1; i >= 0; i-- {
			if nums[i] != target {
				break
			} 
            start = i
		}
		for j = min + 1; j <= high ; j++ {
			if nums[j] != target {
				break
			}
            end = j
		}
		return []int{start, end}
	}

	return []int{-1, -1}
}
```
# my thinking

1. 二分定位位置
2. 两边分别扩散找到起始和终止位置




