# first-bad-version

[https://leetcode.com/problems/first-bad-version/](https://leetcode.com/problems/first-bad-version/)

```
You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

Example:

Given n = 5, and version = 4 is the first bad version.

call isBadVersion(3) -> false
call isBadVersion(5) -> true
call isBadVersion(4) -> true

Then 4 is the first bad version.
```

# solution

```c++
// Forward declaration of isBadVersion API.
bool isBadVersion(int version);

class Solution {
public:
    int firstBadVersion(int n) {
        long low = 1, high = n;
        while (low < high) {
            long mid = (low + high) / 2;
            if (low + 1 == high && !isBadVersion(low) && isBadVersion(high)) {
                return high;
            }
            if (isBadVersion(mid)) {
                if (mid > 1 && !isBadVersion(mid-1)) return mid;
                high = mid;
            } else {
                low = mid;
            }
        }

        return low;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for First Bad Version.
//Memory Usage: 8.3 MB, less than 5.25% of C++ online submissions for First Bad Version.
```
