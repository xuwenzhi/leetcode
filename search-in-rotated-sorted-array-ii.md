# search-in-rotated-sorted-array-ii

[https://leetcode.com/problems/search-in-rotated-sorted-array-ii/](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/)

# thinking

1. 实际上就是想象一段虚拟的空间，将左侧的部分移动到右面，只要保证 **mid** 的计算不越界即可.

![https://github.com/xuwenzhi/leetcode/raw/master/images/search-in-rotated-sorted-array-ii1.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/search-in-rotated-sorted-array-ii1.jpg)


# my solution

```golang
func search(nums []int, target int) bool {
    if (len(nums) == 0) {
        return false
    }
    var pivot,length, i = 0, len(nums), 0
    var low, high, mid int
    for ; i < length - 1; i++ {
        if nums[i] > nums[i+1] {
            pivot = i + 1
            break
        }
    }
    high = length - 1 + pivot;
    low  = pivot;

    for low <= high {
        mid = (low + (high - low) / 2);
        if target == nums[mid % length] {
            return true
        } else if target < nums[mid % length] {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }

    return false
}
```
