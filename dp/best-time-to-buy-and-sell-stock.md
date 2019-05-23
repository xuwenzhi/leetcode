# best-time-to-buy-and-sell-stock

[https://leetcode.com/problems/best-time-to-buy-and-sell-stock/submissions/](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/submissions/)

```
Say you have an array for which the ith element is the price of a given stock on day i.

If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.

Note that you cannot sell a stock before you buy one.

Example 1:

Input: [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
             Not 7-1 = 6, as selling price needs to be larger than buying price.
Example 2:

Input: [7,6,4,3,1]
Output: 0
Explanation: In this case, no transaction is done, i.e. max profit = 0.
```

# thinking

- 数组元素为 non-negative

# solution (brute force)

```c++
// O(n^2) Runtime, O(1) Space.
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int l = prices.size();
        if (l <= 1) return 0;
        int res = 0;
        for (int i=0;i<l;i++) {
            for (int j=i+1;j<l;j++) {
                if (prices[j] > prices[i]) {
                    res = max(res, prices[j] - prices[i]);    
                }
            }
        }
        
        return res;
    }
};
//Runtime: 976 ms, faster than 5.04% of C++ online submissions for Best Time to Buy and Sell Stock.
//Memory Usage: 9.6 MB, less than 20.02% of C++ online submissions for Best Time to Buy and Sell Stock.
```

# solution

一开始把这个问题想复杂了，其实只需要用一个标志位标记当前的最小值就好了，当遇到比标志位还小的，就更换标记位，然后计算每一次的最大profit就完事了.

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int l = prices.size();
        if (l <= 1) return 0;
        int res = 0;
        
        int tmp = prices[0];
        for (int i=1;i<l;i++) {
            if (tmp > prices[i]) {
                tmp = prices[i];
                continue;
            }
            res = max(res, prices[i]-tmp);
        }
        
        return res;
    }
};
//Runtime: 12 ms, faster than 31.08% of C++ online submissions for Best Time to Buy and Sell Stock.
//Memory Usage: 9.7 MB, less than 6.22% of C++ online submissions for Best Time to Buy and Sell Stock.
```

# solution (Kadane's algorithm)

关于[Kadane's algorithm](https://zh.wikipedia.org/wiki/%E6%9C%80%E5%A4%A7%E5%AD%90%E6%95%B0%E5%88%97%E9%97%AE%E9%A2%98)的解法，在[maximum-subarray](https://github.com/xuwenzhi/leetcode/blob/master/dp/maximum-subarray.md)也有应用。

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int l = prices.size();
        if (l <= 1) return 0;
        
        int max_cur = 0, res = 0;
        for (int i=1;i<l;i++) {
            max_cur = max(0, max_cur += prices[i] - prices[i-1]);
            res = max(res, max_cur);
        }
        return res;
    }
};
//Runtime: 8 ms, faster than 94.33% of C++ online submissions for Best Time to Buy and Sell Stock.
//Memory Usage: 9.7 MB, less than 5.80% of C++ online submissions for Best Time to Buy and Sell Stock.
```