# remove-duplicates-from-sorted-array

[https://leetcode.com/problems/remove-duplicates-from-sorted-array/](https://leetcode.com/problems/remove-duplicates-from-sorted-array/)

# my solution

O(LogN)

```
int removeDuplicates(int* nums, int numsSize) {
    if (numsSize <= 1) {
        return numsSize;
    }
    int i, result = 1;
    for (;i < numsSize; i++) {
        if (nums[result-1] != nums[i]) {
            nums[result++] = nums[i];
        }
    }
    
    return result;
}
```

# thinking

1. Replace step by step.
