# single-number

[https://leetcode.com/problems/single-number/](https://leetcode.com/problems/single-number/)

```
Given a non-empty array of integers, every element appears twice except for one. Find that single one.

Note:

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example 1:

Input: [2,2,1]
Output: 1
Example 2:

Input: [4,1,2,1,2]
Output: 4
```

# thinking

这个解决方案就是最优的了，充分利用了XOR的特性。

当然，如果使用一些额外的数据来存储，也是可以的，只不过时间复杂度会更多.

# solution

```
int singleNumber(int* nums, int numsSize) {
    int res = 0;

    for (int i = 0; i < numsSize; i++) {
        res = res ^ nums[i];
    }

    return res;
}
```
# relative

[Single Number ii](https://leetcode.com/problems/single-number-ii/)

[Single Number iii](https://leetcode.com/problems/single-number-iii/)
