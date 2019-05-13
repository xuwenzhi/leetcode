# min-cost-climbing-stairs

[https://leetcode.com/problems/min-cost-climbing-stairs/](https://leetcode.com/problems/min-cost-climbing-stairs/)


```
On a staircase, the i-th step has some non-negative cost cost[i] assigned (0 indexed).

Once you pay the cost, you can either climb one or two steps. You need to find minimum cost to reach the top of the floor, and you can either start from the step with index 0, or the step with index 1.

Example 1:

Input: cost = [10, 15, 20]
Output: 15
Explanation: Cheapest is start on cost[1], pay that cost and go to the top.
Example 2:

Input: cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
Output: 6
Explanation: Cheapest is start on cost[0], and only step on 1s, skipping cost[3].
Note:

cost will have a length in the range [2, 1000].
Every cost[i] will be an integer in the range [0, 999].
```
# solution

这道题需要注意的是当到达n时，如果从n-1处计算则可以忽略n处的值，如果从n-2处计算，则需要与n相加.

```c++
class Solution {
private:
    unordered_map<int,int> m;
public:
    int minCostClimbingStairs(vector<int>& cost) {
        int l = cost.size();
        if (l == 2) {
            return min(cost[0], cost[1]);
        }
        return minCost(cost, l-1);
    }

    int minCost(vector<int> &cost, int n) {
        if (m[n]) return m[n];
        if (n == 0) return cost[0];
        if (n == 1) return cost[1];

        if (n == cost.size()-1) {
            m[n] = min(minCost(cost, n-1), minCost(cost, n-2) + cost[n]);
        } else {
            m[n] = min(minCost(cost, n-1), minCost(cost, n-2)) + cost[n];
        }

        return m[n];
    }
};
//Runtime: 12 ms, faster than 45.80% of C++ online submissions for Min Cost Climbing Stairs.
//Memory Usage: 11.2 MB, less than 5.32% of C++ online submissions for Min Cost Climbing Stairs.
```
