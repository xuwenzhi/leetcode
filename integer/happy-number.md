# happy-number

[https://leetcode.com/problems/happy-number/](https://leetcode.com/problems/happy-number/)

```
Write an algorithm to determine if a number is "happy".

A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

Example:

Input: 19
Output: true
Explanation:
12 + 92 = 82
82 + 22 = 68
62 + 82 = 100
12 + 02 + 02 = 1
```

# solution

```c++
class Solution {
public:
    bool isHappy(int n) {
        unordered_map<int,bool> m;

        while (n != 1) {
            int sum = 0;
            while (n != 0) {
                sum += pow(n % 10, 2);
                n /= 10;
            }
            if (m[sum]) return false;
            m[sum] = true;
            n = sum;
        }

        return true;
    }
};
//Runtime: 4 ms, faster than 97.56% of C++ online submissions for Happy Number.
//Memory Usage: 8.8 MB, less than 5.92% of C++ online submissions for Happy Number.
```
