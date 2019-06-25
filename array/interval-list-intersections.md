# interval-list-intersections

[https://leetcode.com/problems/interval-list-intersections/](https://leetcode.com/problems/interval-list-intersections/)

```
Given two lists of closed intervals, each list of intervals is pairwise disjoint and in sorted order.

Return the intersection of these two interval lists.

(Formally, a closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.  The intersection of two closed intervals is a set of real numbers that is either empty, or can be represented as a closed interval.  For example, the intersection of [1, 3] and [2, 4] is [2, 3].)

 

Example 1:

```
![https://assets.leetcode.com/uploads/2019/01/30/interval1.png](https://assets.leetcode.com/uploads/2019/01/30/interval1.png)
```

Input: A = [[0,2],[5,10],[13,23],[24,25]], B = [[1,5],[8,12],[15,24],[25,26]]
Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
Reminder: The inputs and the desired output are lists of Interval objects, and not arrays or lists.
 

Note:

0 <= A.length < 1000
0 <= B.length < 1000
0 <= A[i].start, A[i].end, B[i].start, B[i].end < 10^9
NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
```
# thinking

使用两个下标 i j，分别对应A和B，然后做判断拼好 {left, right} 就好了，需要注意的点是，i和j 两个指针的移动需要注意。

1. 当两个节点的 right 相等时，需要注意，如果i和j均已达到最后，则break就好了。如果没有到最后，移动可以移动的

2. 如果A.right > B.right 则移动j

3. 如果A.right < B.right 则移动i

# solution 

```c++
class Solution {
public:
    vector<vector<int>> intervalIntersection(vector<vector<int>>& A, vector<vector<int>>& B) {
        vector<vector<int>> res;
        int la = A.size(),lb = B.size();
        if (!la || !lb) return res;
        int i=0,j=0;
        while (i < la && j<lb) {
            int left = max(A[i][0], B[j][0]);
            int right = min(A[i][1], B[j][1]);
            if (left <= right) 
                res.push_back({left, right});   
            
            if (A[i][1] == B[j][1]) {
                if (i == la-1 && j == lb-1) break;
                i += i < la-1 ? 1 : 0;
                j += j < lb-1 ? 1 : 0;
            } else if (A[i][1] > B[j][1])
                j++;
            else 
                i++;

        }
        
        return res;
    }
};
//Runtime: 52 ms, faster than 65.80% of C++ online submissions for Interval List Intersections.
//Memory Usage: 15.8 MB, less than 18.56% of C++ online submissions for Interval List Intersections.
```