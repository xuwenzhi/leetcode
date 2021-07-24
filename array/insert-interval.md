# insert-interval

[https://leetcode.com/problems/insert-interval/](https://leetcode.com/problems/insert-interval/)

```
Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

You may assume that the intervals were initially sorted according to their start times.

Example 1:

Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]
Example 2:

Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
```

# thinking

这道题和[[Hard]range-module - 范围模块](https://github.com/xuwenzhi/leetcode/blob/master/design/range-module.md)是一回事，所以第一个方案也是用一个map来解决的。

# solution (map)

```c++
class Solution {
public:
    vector<vector<int>> insert(vector<vector<int>>& intervals, vector<int>& newInterval) {
        if (intervals.size() == 0) return {newInterval};
        map<int, int> m;
        for (auto interval: intervals) {
            m[interval[0]] = interval[1];
        }
        
        auto l = m.upper_bound(newInterval[0]);
        auto r = m.upper_bound(newInterval[1]);
        int left = newInterval[0], right = newInterval[1];
        
        if (l != m.begin() && (--l)->second < left) {
            ++l;
        }
        
        if (l == r) {
            m.insert({left, right});
        } else {
            int i = min(l->first, left);
            int j = max(right, (--r)->second);
            m.erase(l, ++r);
            m.insert({i, j});
        }
        
        vector<vector<int>> ans;
        for (auto n: m) {
            ans.push_back({n.first, n.second});
        }
        
        return ans;
    }
};
//Runtime: 20 ms, faster than 53.02% of C++ online submissions for Insert Interval.
//Memory Usage: 13.4 MB, less than 5.02% of C++ online submissions for Insert Interval.
```

# solution (equal_range)

这个做法是参考了论坛上的做法，使用C++内置的 **equal_range()** 来求取一段区间中新插入区间的位置，返回值为一个pair，pair->first 相当于 lower_bound()的作用， pair->second 相当于 upper_bound() 的作用，当然，还需要一个配合 equal_range() 的 compare。

```c++
class Solution {
public:
    vector<vector<int>> insert(vector<vector<int>>& intervals, vector<int>& newInterval) {
        int l = intervals.size();
        if (l == 0) return {newInterval};
        auto comp = [](const auto a, const auto b) {
            return a[1] < b[0];
        };
        auto bounds = equal_range(intervals.begin(), intervals.end(), newInterval, comp);
        auto it1 = bounds.first, it2 = bounds.second;
        
        // it1 and it2 are in the tail of the vector
        if (it1 == it2) {
            intervals.insert(it1, newInterval);
        } else {
            it2--;
            (*it2)[0] = min((*it1)[0], newInterval[0]);
            (*it2)[1] = max((*it2)[1], newInterval[1]);
            intervals.erase(it1, it2); // remove all elements between itr1 and itr2
        }
        
        return intervals;
    }
};
//Runtime: 12 ms, faster than 90.90% of C++ online submissions for Insert Interval.
//Memory Usage: 17.1 MB, less than 41.25% of C++ online submissions for Insert Interval.
```

# refer

[Elegant C++ STL solution, using "equal_range" to find overlapped intervals.](https://leetcode.com/problems/insert-interval/discuss/21599/)

[std::equal_range](http://www.cplusplus.com/reference/algorithm/equal_range/)