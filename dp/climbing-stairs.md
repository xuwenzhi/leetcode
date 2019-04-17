# climbing-stairs

[https://leetcode.com/problems/climbing-stairs/](https://leetcode.com/problems/climbing-stairs/)

```
ou are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Note: Given n will be a positive integer.

Example 1:

Input: 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps
Example 2:

Input: 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
```

# thinking

最经典的动态规划问题了。

# solution

```c++
class Solution {
public:
    int climbStairs(int n) {
        vector<int> map(n+1);

        return climbStairs(n, map);
    }

    int climbStairs(int n, vector<int> &vec) {
        if (n == 1) return 1;
        if (n == 2) return 2;

        if (vec[n]) {
            return vec[n];
        }
        vec[n] = climbStairs(n-1, vec) + climbStairs(n-2, vec);
        return vec[n];
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Climbing Stairs.
//Memory Usage: 8.7 MB, less than 25.13% of C++ online submissions for Climbing Stairs.
```
