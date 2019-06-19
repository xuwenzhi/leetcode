# range-module

[https://leetcode.com/problems/range-module/](https://leetcode.com/problems/range-module/)

```
A Range Module is a module that tracks ranges of numbers. Your task is to design and implement the following interfaces in an efficient manner.

addRange(int left, int right) Adds the half-open interval [left, right), tracking every real number in that interval. Adding an interval that partially overlaps with currently tracked numbers should add any numbers in the interval [left, right) that are not already tracked.
queryRange(int left, int right) Returns true if and only if every real number in the interval [left, right) is currently being tracked.
removeRange(int left, int right) Stops tracking every real number currently being tracked in the interval [left, right).
Example 1:

addRange(10, 20): null
removeRange(14, 16): null
queryRange(10, 14): true (Every number in [10, 14) is being tracked)
queryRange(13, 15): false (Numbers like 14, 14.03, 14.17 in [13, 15) are not being tracked)
queryRange(16, 17): true (The number 16 in [16, 17) is still being tracked, despite the remove operation)
Note:

A half open interval [left, right) denotes all real numbers left <= x < right.
0 < left < right < 10^9 in all calls to addRange, queryRange, removeRange.
The total number of calls to addRange in a single test case is at most 1000.
The total number of calls to queryRange in a single test case is at most 5000.
The total number of calls to removeRange in a single test case is at most 1000.
```

# thinking

这道题和[[Hard]data-stream-as-disjoint-intervals - 合并邻接数据范围](https://github.com/xuwenzhi/leetcode/blob/master/design/data-stream-as-disjoint-intervals.md)基本均属一类题，所以从最开始就决定使用map做，不过最开始写的很乱，分支很多，所以就放弃了。最后参考了下大神的方案，所以就。。。

基本思路还是一样，将范围按照k-v的形式存储在map中，map自动排序，省去了一些考虑的点。

当需要 addRange 操作时，需要找到当前left在 map 中的位置，而C++只有xxx_bound()，没法直接找到第一个小于left的函数，所以又因为左区间是闭区间，所以使用的是upper_bound()而不是 lower_bound()。另外需要考虑的是 left和right 可能落在一个区间，也有可能落在不同的区间。

# solution (map)

```c++
class RangeModule {
private:
    map<int,int> m;
    pair<int, int> find(int left, int right) {
        auto l = m.upper_bound(left), r = m.upper_bound(right);
        if (l!=m.begin() && (--l)->second < left) ++l;
        // left和right分布在一个区间中，则直接返回left 和 right即可
        if (l == r) return {left, right};
        int i = min(l->first, left);
        int j = max((--r)->second, right);// 这个地方r需要--，因为到这个位置的话，l和r已经不在一个区间了，而r很有可能已经是m.end()了
        m.erase(l, ++r); //当left和right分布在多个区间时，需要清除掉l 到 r所有的key
        return {i, j};
    }
public:
    RangeModule() {
        
    }
        
    void addRange(int left, int right) {
        auto x = find(left, right);
        m[x.first] = x.second;
    }
    
    bool queryRange(int left, int right) {
        auto it = m.upper_bound(left);
        return it != m.begin() && (--it)->second >= right;
    }
    
    void removeRange(int left, int right) {
        auto x = find(left, right);
        if (left > x.first) m[x.first] = left;
        if (x.second > right) m[right] = x.second;
    }
};

/**
 * Your RangeModule object will be instantiated and called as such:
 * RangeModule* obj = new RangeModule();
 * obj->addRange(left,right);
 * bool param_2 = obj->queryRange(left,right);
 * obj->removeRange(left,right);
 */
//Runtime: 276 ms, faster than 83.67% of C++ online submissions for Range Module.
//Memory Usage: 65.3 MB, less than 84.04% of C++ online submissions for Range Module.
```

# refer

[[LeetCode] Range Module 范围模块](https://www.cnblogs.com/grandyang/p/8586531.html)