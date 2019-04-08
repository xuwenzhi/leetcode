# Search Insert Position
[https://leetcode.com/problems/search-insert-position/](https://leetcode.com/problems/search-insert-position/)

```golang
// O(n)
func searchInsert(nums []int, target int) int {
	if len(nums) == 0 {
		return 0
	}
	var i = 0
	for ; i < len(nums); i++ {
		if nums[i] > target {
			if i == 0 {
				return 0
			} else {
				return i
			}
		}
		if nums[i] == target {
			return i
		}
	}

	return i
}
```


```golang
// O(logn)
func searchInsert(nums []int, target int) int {
	var length = len(nums)
	if length == 0 {
		return 0
	}
	var low, high, middle = 0, length - 1, 0
	for low < high {
		middle = int((high + low) / 2)
		if nums[middle] == target {
			return middle
		} else if nums[middle] < target {
			low = middle + 1
		} else {
			high = middle - 1
		}
	}
	if target <= nums[low] {
		return low
	} else {
		return low + 1
	}
}
```