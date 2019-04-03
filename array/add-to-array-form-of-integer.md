# add-to-array-form-of-integer

# tag

add-nums

[https://leetcode.com/problems/add-to-array-form-of-integer/](https://leetcode.com/problems/add-to-array-form-of-integer/)

```
For a non-negative integer X, the array-form of X is an array of its digits in left to right order.  For example, if X = 1231, then the array form is [1,2,3,1].

Given the array-form A of a non-negative integer X, return the array-form of the integer X+K.



Example 1:

Input: A = [1,2,0,0], K = 34
Output: [1,2,3,4]
Explanation: 1200 + 34 = 1234
Example 2:

Input: A = [2,7,4], K = 181
Output: [4,5,5]
Explanation: 274 + 181 = 455
Example 3:

Input: A = [2,1,5], K = 806
Output: [1,0,2,1]
Explanation: 215 + 806 = 1021
Example 4:

Input: A = [9,9,9,9,9,9,9,9,9,9], K = 1
Output: [1,0,0,0,0,0,0,0,0,0,0]
Explanation: 9999999999 + 1 = 10000000000


Note：

1 <= A.length <= 10000
0 <= A[i] <= 9
0 <= K <= 10000
If A.length > 1, then A[0] != 0

```

# thinking

顺序从右侧搞起就好了。

Notice:注意A可能为[0],K为888这种case

# solution

```c++
class Solution {
public:
    vector<int> addToArrayForm(vector<int>& A, int K) {
        int cur = A.size()-1, over = 0;
        vector<int> res{};
        while (cur >= 0 || over || K) {
            int sum = over;
            if (cur >=0) sum += A[cur];
            sum += K % 10;

            K /= 10;
            over = sum / 10;
            res.push_back(sum % 10);

            cur--;
        }

        reverse(std::begin(res), std::end(res));

        return res;
    }
};
```
Runtime: 132 ms, faster than 78.75% of C++ online submissions for Add to Array-Form of Integer.

Memory Usage: 13.8 MB, less than 52.29% of C++ online submissions for Add to Array-Form of Integer.
