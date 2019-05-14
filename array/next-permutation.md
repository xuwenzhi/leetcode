# next-permutation

[https://leetcode.com/problems/next-permutation/](https://leetcode.com/problems/next-permutation/)

```
Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

The replacement must be in-place and use only constant extra memory.

Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.

1,2,3 → 1,3,2
3,2,1 → 1,2,3
1,1,5 → 1,5,1


```

# solution

借用c++的next_permutation()搞定，这个题类似于求大于一个数的最小值那道题，附stl源码[https://www.kancloud.cn/digest/stl-sources/177297](https://www.kancloud.cn/digest/stl-sources/177297)

```c++
class Solution {
public:
    void nextPermutation(vector<int>& nums) {
        int l = nums.size();
        if (l <= 1) return;

        int i = l - 2;
        while (i >= 0 && nums[i] >= nums[i+1]) i--;

        if (i < 0) {
            reverse(nums.begin(), nums.end());
            return;
        }
        int j = l-1;
        while (nums[j] <= nums[i]) j--;

        swap(nums[j], nums[i]);

        reverse(nums.begin()+i+1, nums.end());
    }
};
//Runtime: 8 ms, faster than 98.40% of C++ online submissions for Next Permutation.
//Memory Usage: 8.7 MB, less than 99.79% of C++ online submissions for Next Permutation.
```
