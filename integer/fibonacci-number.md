# fibonacci-number

[https://leetcode.com/problems/fibonacci-number/](https://leetcode.com/problems/fibonacci-number/)

```
The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

F(0) = 0,   F(1) = 1
F(N) = F(N - 1) + F(N - 2), for N > 1.
Given N, calculate F(N).



Example 1:

Input: 2
Output: 1
Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
Example 2:

Input: 3
Output: 2
Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
Example 3:

Input: 4
Output: 3
Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.


Note:

0 ≤ N ≤ 30.
```

# thinking

斐波那契数列，最简单的就是通过递归解决了。然后下面还提供了一个**dp**版解决方案，速度那是杠杠的。

# solution (pure recursion)

```
class Solution {
public:
    int fib(int N) {
        if (N <= 0 || N > 30) return 0;
        if (N <= 2) return 1;

        return fib(N-1) + fib(N-2);
    }
};
//Runtime: 8 ms, faster than 38.12% of C++ online submissions for Fibonacci Number.
//Memory Usage: 8.2 MB, less than 96.87% of C++ online submissions for Fibonacci Number.
```

# solution (dp)

```
class Solution {
public:
    int fib(int N) {
        if (N <= 0 || N > 30) return 0;

        vector<int> vec(N+1);
        return fib(N, vec);
    }

    int fib(int N, vector<int> &vec) {
        if (N <= 2) return 1;
        if (vec[N]) {
            return vec[N];
        }
        vec[N] = fib(N-1, vec) + fib(N-2, vec);
        return vec[N];
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Fibonacci Number.
//Memory Usage: 8.4 MB, less than 51.32% of C++ online submissions for Fibonacci Number.
```
