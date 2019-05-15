# guess-number-higher-or-lower

[https://leetcode.com/problems/guess-number-higher-or-lower/](https://leetcode.com/problems/guess-number-higher-or-lower/)


```
We are playing the Guess Game. The game is as follows:

I pick a number from 1 to n. You have to guess which number I picked.

Every time you guess wrong, I'll tell you whether the number is higher or lower.

You call a pre-defined API guess(int num) which returns 3 possible results (-1, 1, or 0):

-1 : My number is lower
 1 : My number is higher
 0 : Congrats! You got it!
Example :

Input: n = 10, pick = 6
Output: 6
```

# solution

```c++
// Forward declaration of guess API.
// @param num, your guess
// @return -1 if my number is lower, 1 if my number is higher, otherwise return 0
int guess(int num);

class Solution {
public:
    int guessNumber(int n) {
        long low = 1, high = n;
        while (low < high) {
            long mid = (low + high) / 2;
            if (guess(mid) == -1) {
                high = mid-1;
            } else if (guess(mid) == 1) {
                low = mid+1;
            } else {
                return mid;
            }
        }

        return low;
    }
};
//Runtime: 4 ms, faster than 96.42% of C++ online submissions for Guess Number Higher or Lower.
//Memory Usage: 8.2 MB, less than 25.20% of C++ online submissions for Guess Number Higher or Lower.
```
