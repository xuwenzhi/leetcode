# find-the-duplicate-number

[https://leetcode.com/problems/find-the-duplicate-number/](https://leetcode.com/problems/find-the-duplicate-number/)

```
Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.

Example 1:
Input: [1,3,4,2,2]
Output: 2

Example 2:
Input: [3,1,3,4,2]
Output: 3
Note:

You must not modify the array (assume the array is read only).
You must use only constant, O(1) extra space.
Your runtime complexity should be less than O(n2).
There is only one duplicate number in the array, but it could be repeated more than once.

```

# thinking

这个题本身如果没有那么多限制条件的话是很简单的，甚至暴力查找的效率也是很低的。

# solution

## 暴力查找

```c
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

## 二分查找

[[LeetCode] Find the Duplicate Number 寻找重复数](http://www.cnblogs.com/grandyang/p/4843654.html)

```
class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        int left = 0, right = nums.size();
        while (left < right){
            int mid = left + (right - left) / 2, cnt = 0;
            for (int num : nums) {
                if (num <= mid) ++cnt;
            }
            if (cnt <= mid) left = mid + 1;
            else right = mid;
        }
        return right;
    }
};
```

## 抽象环查找

把数组想象为一个成环的链表，查找成环点(参考[https://blog.csdn.net/monkeyduck/article/details/50439840](https://blog.csdn.net/monkeyduck/article/details/50439840))

相关题目[linked-list-cycle-ii](https://github.com/xuwenzhi/leetcode/blob/master/linked-list-cycle-ii.md)

```c++
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
