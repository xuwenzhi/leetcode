# data-stream-as-disjoint-intervals

[https://leetcode.com/problems/data-stream-as-disjoint-intervals/](https://leetcode.com/problems/data-stream-as-disjoint-intervals/)

```
Given a data stream input of non-negative integers a1, a2, ..., an, ..., summarize the numbers seen so far as a list of disjoint intervals.

For example, suppose the integers from the data stream are 1, 3, 7, 2, 6, ..., then the summary will be:

[1, 1]
[1, 1], [3, 3]
[1, 1], [3, 3], [7, 7]
[1, 3], [7, 7]
[1, 3], [6, 7]
Follow up:
What if there are lots of merges and the number of disjoint intervals are small compared to the data stream's size?

NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
```

# solution (map)

这个方案是使用map存储区间，即k为起始区间，而v为终止区间，这样会依照 map 自动排序的特性，将区间的其实排序起来。而在插入值 val 时，首先通过c++内置的 lower_bound() 来找到应该插入的位置，这时候就要区分三种情况，比如当前 map 中存储的区间为 [[2,4],[6,6]]

1. 当val=1， 这时候，lower_bound() 会将迭代器置为 map.begin()

2. 当val=10，这时候，lower_bound() 会将迭代器置为 map.end()

3. 当val=5，这时候，lower_bound() 会将迭代器置在 k为6的位置上，此时，只需要判断 val 跟 [2,4] 和 [6,6] 的关系处理即可了。

```c++
class SummaryRanges {
private:
    map<int, int> m;
public:
    /** Initialize your data structure here. */
    SummaryRanges() {
        
    }
    
    void addNum(int val) {
        if (m.empty()) {
            m.insert({val, val});
        } else {
            auto lit = m.lower_bound(val);
            
            // 单独处理插入数小于最小范围
            if (lit == m.begin()) {
                if (lit->first > val + 1) {
                    m.insert({val, val});
                } else {
                    if (lit->first != val) {
                        m.insert({min(val, lit->first), lit->second});
                        m.erase(lit);
                    }
                }
                return;
            }
            // 单独处理插入数大于最大范围
            if (lit == m.end()) {
                lit--;
                if (lit->second +1 < val) {
                    m.insert({val, val});
                } else {
                    lit->second = max(lit->second, val);
                }
                return;
            }
            
            auto uit = lit;
            lit = prev(lit, 1);

            if (lit->second + 1 == val && uit->first == val + 1) {
                lit->second = uit->second;
                m.erase(uit);
            } else if (lit->second+1 >= val && uit->first > val+1) {
                lit->second = max(lit->second, val);
            } else if (lit->second+1 < val && uit->first == val+1) {
                m.insert({val, uit->second});
                m.erase(uit);
            } else {
                m.insert({val, val});
            }
        }
    }
    
    vector<vector<int>> getIntervals() {
        vector<vector<int>> res;
        for (auto i:m) {
            res.push_back({i.first, i.second});
        }
        
        return res;
    }
};

/**
 * Your SummaryRanges object will be instantiated and called as such:
 * SummaryRanges* obj = new SummaryRanges();
 * obj->addNum(val);
 * vector<vector<int>> param_2 = obj->getIntervals();
 */
//Runtime: 112 ms, faster than 64.93% of C++ online submissions for Data Stream as Disjoint Intervals.
//Memory Usage: 27.8 MB, less than 19.55% of C++ online submissions for Data Stream as Disjoint Intervals.
```