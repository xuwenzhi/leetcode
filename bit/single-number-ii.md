# single-number-ii

[https://leetcode.com/problems/single-number-ii/](https://leetcode.com/problems/single-number-ii/)

```
Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.

Note:

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example 1:

Input: [2,2,3,2]
Output: 3
Example 2:

Input: [0,1,0,1,0,1,99]
Output: 99
```

# thinking

这个还真是有点不知道咋说啊~迷惑~

# solution

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int one=0, two=0, three = 0;
        for (int i = 0;i<nums.size();i++) {
            two |= one & nums[i];// two如果有，则证明one这时候已经有了
            one ^= nums[i];// 第一个更新one，最后的结果也在one
            three = one & two;// 如果one和two都有，则three
            one &= ~three;
            two &= ~three;
        }
        return one;
    }
};
//Runtime: 20 ms, faster than 17.44% of C++ online submissions for Single Number II.
//Memory Usage: 9.5 MB, less than 90.57% of C++ online submissions for Single Number II.
```
