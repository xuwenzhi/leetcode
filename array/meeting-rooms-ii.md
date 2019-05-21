# meeting-rooms-ii

[https://leetcode.com/problems/meeting-rooms-ii/](https://leetcode.com/problems/meeting-rooms-ii/)

```
Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.

Example 1:

Input: [[0, 30],[5, 10],[15, 20]]
Output: 2
Example 2:

Input: [[7,10],[2,4]]
Output: 1
NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
```

# solution (timeline)

这个方案就是挨个把时间节点搞到一个时间线上，起始点+1，结束点-1，也就是意味着，**开始时间开启一个会议室，结束时间关闭一个会议室**。而且使用map（自带sort）来存储，最后遍历map也是按照时间线的顺序处理。

```
// [[0, 30],[5, 10],[15, 20]]
0:1
5:1
10:-1
15:1
20:-1
30:-1
```
```c++
// O(NlogN) Runtime, O(n) Space.
class Solution {
public:
    int minMeetingRooms(vector<vector<int>>& intervals) {
        map<int,int> m;
        for (auto i : intervals) {
            m[i[0]]++;
            m[i[1]]--;
        }
        
        int rooms=0,res=0;
        for (auto i : m) {
            res = max(res, rooms += i.second);
        }
        
        return res;
    }
};
//Runtime: 24 ms, faster than 32.74% of C++ online submissions for Meeting Rooms II.
//Memory Usage: 14.4 MB, less than 5.04% of C++ online submissions for Meeting Rooms II.
```

# solution (min heap)

> 这种方法先把所有的时间区间按照起始时间排序，然后新建一个最小堆，开始遍历时间区间，如果堆不为空，且首元素小于等于当前区间的起始时间，我们去掉堆中的首元素，把当前区间的结束时间压入堆，由于最小堆是小的在前面，那么假如首元素小于等于起始时间，说明上一个会议已经结束，***可以用该会议室开始下一个会议了***，所以不用分配新的会议室，遍历完成后堆中元素的个数即为需要的会议室的个数

```c++
class Solution {
public:
    int minMeetingRooms(vector<vector<int>>& intervals) {
        sort(intervals.begin(), 
            intervals.end(), 
            [](const vector<int> &a, const vector<int> &b){return a[0] < b[0];});
        
        priority_queue<int, vector<int>, greater<int>> q;
        
        for (int i=0;i<intervals.size();i++) {
            if (!q.empty() && q.top() <= intervals[i][0]) q.pop();
            q.push(intervals[i][1]);
        }
        
        return q.size();
    }
};
//Runtime: 24 ms, faster than 32.74% of C++ online submissions for Meeting Rooms II.
//Memory Usage: 12.2 MB, less than 15.11% of C++ online submissions for Meeting Rooms II.
```

# refer

[[LeetCode] Meeting Rooms II 会议室之二](https://www.cnblogs.com/grandyang/p/5244720.html)