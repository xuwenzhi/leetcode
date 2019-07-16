# daily-temperatures

[https://leetcode.com/problems/daily-temperatures/](https://leetcode.com/problems/daily-temperatures/)

```
Given a list of daily temperatures T, return a list such that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.

For example, given the list of temperatures T = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].

Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].
```

# thinking

Note:

1. 数据量最大为30000
2. 元素范围在 [30, 100]

# solution (hashtable)

这个方案使用 **hashtable**，并且从右向左遍历，每次在判断 [当前值+1, 100] 是否存在 hashtable中，如果存在，也要取最小值与当前的 **i** 相减。

```c++
// O(70*n) Runtime, O(n) Space.
class Solution {
public:
    vector<int> dailyTemperatures(vector<int>& T) {
        unordered_map<int,int> m;
        vector<int> res(T.size());
        for (int i=T.size()-1;i>=0;i--) {
            int k = i;
            for (int j=T[i]+1;j<=100;j++) {
                if (m.find(j) != m.end()) {
                    k = k == i ? m[j] : min(m[j], k);
                    if (k == i+1) break;
                }
            }
            res[i] = k - i;
            m[T[i]] = i;
        }
        return res;
    }
};
//Runtime: 396 ms, faster than 5.11% of C++ online submissions for Daily Temperatures.
//Memory Usage: 14.9 MB, less than 65.83% of C++ online submissions for Daily Temperatures.
```

# solution (single stack)

这是一个典型的单调栈解法，维护一个单调递减的栈，栈中存储 **pair<value, key>** ,存储 key 方便后续计算使用。

拿case [73,74,30,71,71,72,76,73] 为例

1. 73入栈
2. 74 > 73，当前74大于栈顶值，则出栈，并且设置 res[0] = 1-0 = 1，74入栈
3. 30 < 74，则只将30入栈，此时栈中元素为 [74, 30]
4. 71 > 30，则将39出栈，设置res[2] = 3-2 = 1。再判断 71 < 74，什么都不做，将71入栈，此时栈中元素为 [74, 71]
5. 71 == 71，则只将71入栈即可，此时栈中元素为 [74,71,71]
6. 72 > 71，则出栈，并设置 res[4] = 5-4 = 1。再判断 72 > 71，执行出栈，并设置 res[3] = 5-3 = 2。再判断72 < 74，则什么都不做，将72入栈。此时栈中元素为 [74, 72]
7. 76 > 72，则出栈，并设置res[5] = 6-5=1。再判断 76 > 74,则出栈，并设置res[1] = 6-1 = 5。此时栈为空，则将76入栈。此时栈中元素为[76]
8. 73 < 76，什么都不做，将73入栈，此时栈中元素为 [76,73]

最后两位的结果赋值为0即可了。

```c++
// O(n) Runtime, O(n) Space.
class Solution {
public:
    vector<int> dailyTemperatures(vector<int>& T) {
        vector<int> res(T.size());
        stack<pair<int,int>> s;
        for (int i=0;i<T.size();i++) {
            while (!s.empty() && s.top().first < T[i]) {
                res[s.top().second] = i-s.top().second;
                s.pop();
            } 
            s.push({T[i], i});
        }
        
        return res;
    }
};
//Runtime: 192 ms, faster than 78.35% of C++ online submissions for Daily Temperatures.
//Memory Usage: 17.7 MB, less than 8.75% of C++ online submissions for Daily Temperatures.
```