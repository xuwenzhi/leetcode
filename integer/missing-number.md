# missing-number

[https://leetcode.com/problems/missing-number/](https://leetcode.com/problems/missing-number/)

```
Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

Example 1:

Input: [3,0,1]
Output: 2
Example 2:

Input: [9,6,4,2,3,5,7,0,1]
Output: 8
Note:
Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
```

# thinking

题目给出N个数的数组，而且范围在0-n，假如这个序列没有缺失的数字，那么排序的情况下就是个等差数列，进而也可以通过等差求和公式计算出来。而如果想计算缺失的那个数，就可以用等差的数减去给出数组的和就得到结果了.

# solution (arithmetic sequence)

```c++
class Solution {
public:
    int missingNumber(vector<int>& nums) {
        int size = nums.size();
        int sum = size * (size+1) / 2;
        return sum - accumulate(nums.begin(), nums.end(), 0);
    }
};
//Runtime: 28 ms, faster than 39.34% of C++ online submissions for Missing Number.
//Memory Usage: 9.8 MB, less than 55.19% of C++ online submissions for Missing Number.
```

# rethinking

另外是通过位运算解决。因为做single-number的时候，通过一个特性就是 **a = a ^ b ^ b**，再想象一下这个数组的key和值是有点意思的。

 0  1  2  3  4
[0, 1, 3, 4, 5]

这样就比较清晰了，可以同时对 key 以及 value 做 XOR操作，最后得到的就是2了，不过注意的是**res**的初始值要为数组的size。

# solution (bit manipulate)

```
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int missingNumber(vector<int>& nums) {
        int len = nums.size();
        int res = len;
        for(int i=0; i<len; i++){
            res = res ^ i ^ nums[i]; // a^b^b = a
        }
        return res;
    }
};
//Runtime: 36 ms, faster than 27.15% of C++ online submissions for Missing Number.
//Memory Usage: 9.8 MB, less than 70.77% of C++ online submissions for Missing Number.
```
