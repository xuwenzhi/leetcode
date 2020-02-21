# minimum-cost-to-connect-sticks

[https://leetcode.com/problems/minimum-cost-to-connect-sticks/](https://leetcode.com/problems/minimum-cost-to-connect-sticks/)

```
You have some sticks with positive integer lengths.

You can connect any two sticks of lengths X and Y into one stick by paying a cost of X + Y.  You perform this action until there is one stick remaining.

Return the minimum cost of connecting all the given sticks into one stick in this way.



 Example 1:

 Input: sticks = [2,4,3]
 Output: 14
 Example 2:

 Input: sticks = [1,8,3,5]
 Output: 30


  Constraints:

  1 <= sticks.length <= 10^4
  1 <= sticks[i] <= 10^4

```

# thinking

最开始这道题我都没想明白咋回事，最后才弄明白是这么回事。
例如case [2,4,3]，最终结果是14。题目要求两两组合直至最后只剩下一根的时候停止，而两两组合会有开销，开销正是 **X+Y**，问最小开销。那么只需要最小的两个数相互结合就完事了。一个有效队列搞定。

```c++
class Solution {
public:
    int connectSticks(vector<int>& sticks) {
        priority_queue<int, vector<int>, greater<int>> q;
        for (auto stick : sticks) {
            q.push(stick);
        }

        int res = 0;
        while (!q.empty()) {
            int first = q.top();q.pop();
            if (!q.empty()) {
                int second = q.top();q.pop();
                int sum = first + second;
                res += sum;
                q.push(sum);
            }
        }

        return res;
    }
};
//Runtime: 128 ms, faster than 65.54% of C++ online submissions for Minimum Cost to Connect Sticks.
//Memory Usage: 12.7 MB, less than 100.00% of C++ online submissions for Minimum Cost to Connect Sticks.
```
