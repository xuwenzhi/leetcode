# arranging-coins

[https://leetcode.com/problems/arranging-coins/](https://leetcode.com/problems/arranging-coins/)

```
You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.

Given n, find the total number of full staircase rows that can be formed.

n is a non-negative integer and fits within the range of a 32-bit signed integer.

Example 1:

n = 5

The coins can form the following rows:
¤
¤ ¤
¤ ¤

Because the 3rd row is incomplete, we return 2.
Example 2:

n = 8

The coins can form the following rows:
¤
¤ ¤
¤ ¤ ¤
¤ ¤

Because the 4th row is incomplete, we return 3.
```

# solution

```
class Solution {
public:
    int arrangeCoins(int n) {
        int i = 1;
        while (true) {
            if (n < i) {
                return i-1;
            }
            n -= i++;
        }
        return 1;
    }
};
//Runtime: 8 ms, faster than 95.46% of C++ online submissions for Arranging Coins.
//Memory Usage: 8.4 MB, less than 65.27% of C++ online submissions for Arranging Coins.
```
