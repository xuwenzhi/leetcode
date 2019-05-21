# merge-intervals

[https://leetcode.com/problems/merge-intervals/](https://leetcode.com/problems/merge-intervals/)

```
Given a collection of intervals, merge all overlapping intervals.

Example 1:

Input: [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
Example 2:

Input: [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
```

# solution (sort)

分析这个题还需要注意有几个情况，比如下面这些case

1. [[1,4],[0,4]] 不一定前面的第一个元素就在前面

2. [[2,3],[4,5],[6,7],[8,9],[1,10]] 前面在怎么不相关，后面来一个就会一网打尽

3. [[1,4],[0,0]] 不能只比较上一个4与下一个0

所以这个方案是先将**intervals**进行排序，然后再挨个比较

```c++
bool sortcol(const vector<int>& v1,
               const vector<int>& v2 ) {
    return v1[0] < v2[0];
}
class Solution {
public:
    vector<vector<int>> merge(vector<vector<int>>& intervals) {
        vector<vector<int>> res;

        sort(intervals.begin(), intervals.end(), sortcol);

        int l = intervals.size();
        for (int i=0;i<l;i++) {
            int j=i+1;
            int mi = intervals[i][0];
            int ma = intervals[i][1];
            for (;j<l;j++) {
                if (intervals[j][0] > ma) {
                    break;
                }
                mi = min(mi, intervals[j][0]);
                ma = max(ma, intervals[j][1]);
            }
            res.push_back({mi, ma});
            i = j-1;
        }
        return res;
    }
};
//Runtime: 32 ms, faster than 19.42% of C++ online submissions for Merge Intervals.
//Memory Usage: 12.6 MB, less than 11.51% of C++ online submissions for Merge Intervals.
```


# solution (find minimun)

这个方案是偶然想到的，每次寻找一个结构体中的最小值，比如[[1,4],[0,4]]，最小值的结构体就是[0,4]，然后从头遍历找到overlap这个最小值结构体的结构体，并把结构体擦除，然后再从头遍历，所以时间复杂度会长很多,也是一个思路吧，优点就是不用排序.

```c++
class Solution {
public:
    int findMinimum(vector<vector<int>>& intervals) {
        int mi = intervals[0][0];
        int res = 0;
        for (int i=1;i<intervals.size();i++) {
            if (intervals[i][0] < mi) {
                mi = intervals[i][0];
                res = i;
            }
        }

        return res;
    }

    vector<vector<int>> merge(vector<vector<int>>& intervals) {
        vector<vector<int>> res;

        int l = intervals.size();
        while (intervals.size() > 0) {
            int i = findMinimum(intervals);
            int mi = intervals[i][0];
            int ma = intervals[i][1];
            intervals.erase(intervals.begin() + i);

            int j=0;
            while (j < intervals.size()) {
                if (intervals[j][0] <= ma ||
                   (intervals[j][0] >= mi && intervals[j][0] <= ma)) {
                    mi = min(mi, intervals[j][0]);
                    ma = max(ma, intervals[j][1]);
                    intervals.erase(intervals.begin() + j);
                    j = 0;
                } else {
                    j++;
                }
            }
            res.push_back({mi, ma});
        }
        return res;
    }
};
//Runtime: 944 ms, faster than 6.44% of C++ online submissions for Merge Intervals.
//Memory Usage: 12.5 MB, less than 13.21% of C++ online submissions for Merge Intervals.
```

# solution (start end)

这个不是很好理解，比较巧妙的东西。

以一个栗子为例: [[2,3],[4,5],[6,7],[8,9],[1,10]]

         i

start : [1,2,4,6,8]

end   : [3,5,7,9,10]

         j

要接受这个方案的前置条件就是，不需要在意start和end中的任意两数到底是不是intervals中的组合.

```c++
class Solution {
public:
    vector<vector<int>> merge(vector<vector<int>>& intervals) {
        vector<vector<int>> res;

        int l = intervals.size();
        vector<int> start(l),end(l);

        for (int i=0;i<l;i++) {
            start[i] = intervals[i][0];
            end[i] = intervals[i][1];
        }

        sort(start.begin(), start.end());
        sort(end.begin(), end.end());

        for (int i=0,j=0;i<l;i++) {
            if (i == l-1 || start[i+1] > end[i]) {
                res.push_back({start[j], end[i]});
                j = i+1;
            }
        }

        return res;
    }
};
//Runtime: 16 ms, faster than 75.69% of C++ online submissions for Merge Intervals.
//Memory Usage: 12.6 MB, less than 10.51% of C++ online submissions for Merge Intervals.
```
