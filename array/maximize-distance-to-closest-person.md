# maximize-distance-to-closest-person

[https://leetcode.com/problems/maximize-distance-to-closest-person/](https://leetcode.com/problems/maximize-distance-to-closest-person/)

```
In a row of seats, 1 represents a person sitting in that seat, and 0 represents that the seat is empty. 

There is at least one empty seat, and at least one person sitting.

Alex wants to sit in the seat such that the distance between him and the closest person to him is maximized. 

Return that maximum distance to closest person.

Example 1:

Input: [1,0,0,0,1,0,1]
Output: 2
Explanation: 
If Alex sits in the second open seat (seats[2]), then the closest person has distance 2.
If Alex sits in any other open seat, the closest person has distance 1.
Thus, the maximum distance to the closest person is 2.
Example 2:

Input: [1,0,0,0]
Output: 3
Explanation: 
If Alex sits in the last seat, the closest person is 3 seats away.
This is the maximum distance possible, so the answer is 3.
Note:

1 <= seats.length <= 20000
seats contains only 0s or 1s, at least one 0, and at least one 1.
```

# thinking

这道题给一个数组，数组中为1的代表已经有人坐了，为0的代表可以继续坐。这时候可以挑一个位置做下，找出距离最近人的最大距离。

比如这个case  [1,0,0,0,1,0,1]， 如果坐的位置离旁边的人最远，则在下标2处。

这个case [1,0,0,0]，坐在最右边的位置，距离下标0的位置最远。

# solution (vector)

这里使用vector记录为1的下标，然后只需要处理这个vector即可了，需要注意的是[1,0,0,0] 的这种case，所以不能遗漏了两边这种情况。

```c++
// O(n) Runtime, O(n) Space.
class Solution {
public:
    int maxDistToClosest(vector<int>& seats) {
        vector<int> h;
        
        for (int i=0;i<seats.size();i++) {
            if (seats[i]) {
                h.push_back(i);
            }
        }
        if (h.size() == 0) return 0;
        
        int res = h[0] - 0;
        for (int i=1;i<h.size();i++) {
            res = max(res, (h[i] - h[i-1])/2);
        }
        int right = seats.size()-1-h[h.size()-1];
        res = max(res, right);
        
        return res;
    }
};
//Runtime: 12 ms, faster than 92.88% of C++ online submissions for Maximize Distance to Closest Person.
//Memory Usage: 10.5 MB, less than 19.03% of C++ online submissions for Maximize Distance to Closest Person.
```