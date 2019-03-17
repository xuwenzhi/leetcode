# find-the-duplicate-number

[https://leetcode.com/problems/find-the-duplicate-number/](https://leetcode.com/problems/find-the-duplicate-number/)

## Note:

1. You must not modify the array (assume the array is read only).
2. You must use only constant, O(1) extra space.
3. Your runtime complexity should be less than O(n2).
4. There is only one duplicate number in the array, but it could be repeated more than once.

# thinking

这个题本身如果没有那么多限制条件的话是很简单的，甚至暴力查找的效率也是很低的。

# solution

## 暴力查找

```
int findDuplicate(int* nums, int numsSize) {
    for (int i = 0; i < numsSize; i++) {
        for (int j = i+1; j < numsSize; j++) {
            if (nums[i] == nums[j]) {
                return nums[i];
            }
        }
    }

    return -1;
}
```

## 把数组想象为一个成环的链表，查找成环点(参考[https://blog.csdn.net/monkeyduck/article/details/50439840](https://blog.csdn.net/monkeyduck/article/details/50439840))

相关题目[linked-list-cycle-ii](https://github.com/xuwenzhi/leetcode/blob/master/linked-list-cycle-ii.md)

```
class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        if (nums.size() > 1){
            int slow = nums[0];
            int fast = nums[nums[0]];
            while (slow != fast)
            {
                slow = nums[slow];
                fast = nums[nums[fast]];
            }

            fast = 0;
            while (fast != slow)
            {
                fast = nums[fast];
                slow = nums[slow];
            }
            return slow;
        }
        return -1;
    }
};
```
