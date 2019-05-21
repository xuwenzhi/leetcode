# meeting-rooms

[https://leetcode.com/problems/meeting-rooms/](https://leetcode.com/problems/meeting-rooms/)

```
Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), determine if a person could attend all meetings.

Example 1:

Input: [[0,30],[5,10],[15,20]]
Output: false
Example 2:

Input: [[7,10],[2,4]]
Output: true
NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
```

# solution

先排序，然后查看是否有overlap就完事了。

```c++
class Solution {
public:
    bool canAttendMeetings(vector<vector<int>>& intervals) {
        int l = intervals.size();
        sort(intervals.begin(), 
            intervals.end(), 
            [](const vector<int> &a, const vector<int> &b){return a[0] < b[0];}); 
        
        for (int i=0;i<l-1;i++) {
            if (intervals[i][1] > intervals[i+1][0]) {
                return false;
            }
        }
        
        return true;
    }
}；
```

# rethinking

不过仔细一想，这个题貌似也可以不用sort，在不是sort的前提下，会增加遍历次数，主要使用Hashtable，存储这个时间点是否被占用了。也是一种思路。

```c++
class Solution {
public:
    bool canAttendMeetings(vector<vector<int>>& intervals) {
        int l = intervals.size();
        unordered_map<int,bool> m;
        
        for (int i=0;i<l;i++) {
            for (int j=intervals[i][0];j<intervals[i][1];j++) {
                if (m[j] == true) {
                    return false;
                }
                m[j] = true;
            }
        }
        
        return true;
    }
};
//Runtime: 796 ms, faster than 5.43% of C++ online submissions for Meeting Rooms.
//Memory Usage: 250.6 MB, less than 5.01% of C++ online submissions for Meeting Rooms.
```


