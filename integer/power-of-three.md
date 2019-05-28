# power-of-three

[https://leetcode.com/problems/power-of-three/](https://leetcode.com/problems/power-of-three/)


```
Given an integer, write a function to determine if it is a power of three.

Example 1:

Input: 27
Output: true
Example 2:

Input: 0
Output: false
Example 3:

Input: 9
Output: true
Example 4:

Input: 45
Output: false
Follow up:
Could you do it without using any loop / recursion?
```

# solution

直接连续除就完了，如果除着除着**n==1**了，那就证明这个数是3的幂次；而如果**n%3 != 0**，也肯定就不是3的幂次。

```c++
class Solution {
public:
    bool isPowerOfThree(int n) {
        if (n <= 0) return false;
        while (n > 0) {
            if (n == 1) return true;
            if (n % 3 != 0) return false;
            n /= 3;
        }

        return true;
    }
};
//Runtime: 12 ms, faster than 97.48% of C++ online submissions for Power of Three.
//Memory Usage: 8.2 MB, less than 31.68% of C++ online submissions for Power of Three.
```

# solution (no loop)

```c++
class Solution {
public:
    bool isPowerOfThree(int n) {
        // 1162261467 is 3^19,  3^20 is bigger than int 
        return (n>0 && 1162261467%n==0);
    }
};
//Runtime: 32 ms, faster than 81.31% of C++ online submissions for Power of Three.
//Memory Usage: 8.1 MB, less than 39.70% of C++ online submissions for Power of Three.
```