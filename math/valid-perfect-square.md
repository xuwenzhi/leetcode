# valid-perfect-square

[https://leetcode.com/problems/valid-perfect-square/](https://leetcode.com/problems/valid-perfect-square/)

```
Given a positive integer num, write a function which returns True if num is a perfect square else False.

Note: Do not use any built-in library function such as sqrt.

Example 1:

Input: 16
Output: true
Example 2:

Input: 14
Output: false
```

# solution (binary search)

```c++
class Solution {
public:
    bool isPerfectSquare(int num) {
        if (num == 1) return true;
        int low=0, high=num;
        while (low < high-1) {
            int mid = low + (high-low)/2;
            if ((long)mid*mid == num) {
                return true;
            } else if ((long)mid*mid < num) {
                low = mid;
            } else {
                high = mid;
            }
        }
        return false;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Valid Perfect Square.
//Memory Usage: 8.3 MB, less than 5.25% of C++ online submissions for Valid Perfect Square.
```
