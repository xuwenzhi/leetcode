# single-number

[https://leetcode.com/problems/single-number/](https://leetcode.com/problems/single-number/)

# relative

[Single Number ii](https://leetcode.com/problems/single-number-ii/)

[Single Number iii](https://leetcode.com/problems/single-number-iii/)


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
