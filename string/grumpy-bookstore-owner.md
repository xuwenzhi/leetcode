# grumpy-bookstore-owner

[https://leetcode.com/problems/grumpy-bookstore-owner/](https://leetcode.com/problems/grumpy-bookstore-owner/)

```
Today, the bookstore owner has a store open for customers.length minutes.  Every minute, some number of customers (customers[i]) enter the store, and all those customers leave after the end of that minute.

On some minutes, the bookstore owner is grumpy.  If the bookstore owner is grumpy on the i-th minute, grumpy[i] = 1, otherwise grumpy[i] = 0.  When the bookstore owner is grumpy, the customers of that minute are not satisfied, otherwise they are satisfied.

The bookstore owner knows a secret technique to keep themselves not grumpy for X minutes straight, but can only use it once.

Return the maximum number of customers that can be satisfied throughout the day.

 

Example 1:

Input: customers = [1,0,1,2,1,1,7,5], grumpy = [0,1,0,1,0,1,0,1], X = 3
Output: 16
Explanation: The bookstore owner keeps themselves not grumpy for the last 3 minutes. 
The maximum number of customers that can be satisfied = 1 + 1 + 1 + 1 + 7 + 5 = 16.
 

Note:

1 <= X <= customers.length == grumpy.length <= 20000
0 <= customers[i] <= 1000
0 <= grumpy[i] <= 1
```

# thinking

Weekly Contest 138的题目，是一个滑动窗口问题，从左向右，每次计算 customers[i ... i+X] 和 [i, i+X]范围以外的 satisfied minutes 的和，然后得到最大值即可。

# solution

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int cal(vector<int>& customers, vector<int>& grumpy, int start, int end) {
        int res = 0;
        for (int i=0;i<customers.size();i++) {
            if (i<start || i>end) {
                res += grumpy[i] ? 0 : customers[i];
            }
        }
        
        return res;
    }
    
    int maxSatisfied(vector<int>& customers, vector<int>& grumpy, int X) {
        int l = customers.size();
        vector<int> sub(X, 0);
        
        int res = 0;
        int max_sub = accumulate(customers.begin(), customers.begin()+X, 0);
        int except = cal(customers, grumpy, 0, X-1);
        
        res = max_sub + cal(customers, grumpy, 0, X-1);
        for (int i=1;i<=l-X;i++) {
            max_sub = max_sub + customers[i+X-1] - customers[i-1];
            if (!grumpy[i-1]) except += customers[i-1];
            if (!grumpy[i+X-1]) except -= customers[i+X-1];
            res = max(res, max_sub + except);
        }
        
        
        return res;
    }
};
//Runtime: 32 ms, faster than 98.86% of C++ online submissions for Grumpy Bookstore Owner.
//Memory Usage: 11.9 MB, less than 100.00% of C++ online submissions for Grumpy Bookstore Owner.
```