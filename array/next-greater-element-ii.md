# next-greater-element-ii

[https://leetcode.com/problems/next-greater-element-ii/](https://leetcode.com/problems/next-greater-element-ii/)

```
Given a circular array (the next element of the last element is the first element of the array), print the Next Greater Number for every element. The Next Greater Number of a number x is the first greater number to its traversing-order next in the array, which means you could search circularly to find its next greater number. If it doesn't exist, output -1 for this number.

Example 1:

Input: [1,2,1]
Output: [2,-1,2]
Explanation: The first 1's next greater number is 2;
The number 2 can't find next greater number;
The second 1's next greater number needs to search circularly, which is also 2.
Note: The length of given array won't exceed 10000.
```

# thinking

这个和[[easy]next-greater-element-i - 找到右侧第一个大于本身的元素](https://github.com/xuwenzhi/leetcode/blob/master/array/next-greater-element-i.md)差不多是一个系列，因为有点类似成环，所以我的处理办法是遍历两遍，而且由于给出的数组中的元素很可能出现重复的，所以使用Stack存储时，存储数组的key。


# solution

```
class Solution {
public:
    vector<int> nextGreaterElements(vector<int>& nums) {
        int len = nums.size();
        if (len == 0) return nums;
        vector<int> res{};
        res.assign(len, -1);
        stack<int> s;
        int i = 0;
        while (i < 2 * len) {
            auto tmp = i % len;
            while (!s.empty() && nums[s.top()] < nums[tmp]) {
                res[s.top()] = nums[tmp];
                s.pop();
            }
            s.push(tmp);
            i++;
        }

        return res;
    }
};
```

Runtime: 88 ms, faster than 98.10% of C++ online submissions for Next Greater Element II.

Memory Usage: 12.5 MB, less than 100.00% of C++ online submissions for Next Greater Element II.
