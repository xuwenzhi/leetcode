# plus-one

[https://leetcode.com/problems/plus-one/](https://leetcode.com/problems/plus-one/)

```
Given a non-empty array of digits representing a non-negative integer, plus one to the integer.

The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.

You may assume the integer does not contain any leading zero, except the number 0 itself.

Example 1:

Input: [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
Example 2:

Input: [4,3,2,1]
Output: [4,3,2,2]
Explanation: The array represents the integer 4321.
```

# thinking

因为怕溢出，所以最开始想的是把数组中数字处理成数字，然后+1，再处理到数组中，不过这也挡不住大数的问题，所以还只能用数组的方式处理，所以使用一个变量over来搞，从右向左依次搞，跟两个链表相加是一个套路了。

[add-two-numbers](https://github.com/xuwenzhi/leetcode/blob/master/linked-list/add-two-numbers.md) **c**
[add-two-numbers-ii](https://github.com/xuwenzhi/leetcode/blob/master/linked-list/add-two-numbers-ii.md) **c** **medium**

# solution

```c++
class Solution {
public:
    vector<int> plusOne(vector<int>& digits) {
        vector<int> res{};
        int len = digits.size();
        int cur = len-1;
        int over = 1;
        while (cur >= 0 || over) {
            int sum = over;
            if (cur >= 0) {
                sum += digits[cur];
            }
            over = sum >= 10 ? 1 : 0;
            res.push_back(sum % 10);
            cur--;
        }
        reverse(res.begin(), res.end());
        return res;
    }
};
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Plus One.

Memory Usage: 8.5 MB, less than 66.67% of C++ online submissions for Plus One.
