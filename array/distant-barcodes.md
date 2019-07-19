# distant-barcodes

[https://leetcode.com/problems/distant-barcodes/](https://leetcode.com/problems/distant-barcodes/)

```
In a warehouse, there is a row of barcodes, where the i-th barcode is barcodes[i].

Rearrange the barcodes so that no two adjacent barcodes are equal.  You may return any answer, and it is guaranteed an answer exists.

 

Example 1:

Input: [1,1,1,2,2,2]
Output: [2,1,2,1,2,1]
Example 2:

Input: [1,1,1,1,2,2,3,3]
Output: [1,3,1,3,2,1,2,1]
 

Note:

1 <= barcodes.length <= 10000
1 <= barcodes[i] <= 10000
```

# thinking

不记得是多少Weekly的Contest了，反正当时也没做出来，所以这次做一下。题目的要求就是使得数组中相邻的数字不能相同，同时也给了一个Hint

> We want to always choose the most common or second most common element to write next. What data structure allows us to query this effectively?

然后想了一下，好像确实是这样，只要遍历出现次数最多的元素和第二次数多的元素就行了，但是同时也要对相应出现的次数做 **-1** 操作才行，这里我使用的是 **priority_queue<pair<int,int>>**，pair的第一个元素存储次数，第二个元素存储元素即可，然后依次遍历。

# solution (priority queue)

```c++
// O(nlogn) Runtime, O(n) Space.
class Solution {
public:
    vector<int> rearrangeBarcodes(vector<int>& barcodes) {
        vector<int> res;
        int l = barcodes.size();

        priority_queue<pair<int,int>, vector<pair<int,int>>> pq;
        unordered_map<int,int> counter;
        for (auto code : barcodes) {
            counter[code]++;
        }
        for (auto c : counter) {
            pq.push({c.second, c.first});
        }
        
        while (!pq.empty()){
            auto top1 = pq.top();
            pq.pop();
            res.push_back(top1.second);
            if (pq.empty()) break;
            auto top2 = pq.top();
            pq.pop();
            res.push_back(top2.second);
            if (top1.first > 1)
                pq.push({top1.first-1, top1.second});
            if (top2.first > 1)
                pq.push({top2.first-1, top2.second});
        }
        
        return res;
    }
};
//Runtime: 260 ms, faster than 37.22% of C++ online submissions for Distant Barcodes.
//Memory Usage: 22.8 MB, less than 100.00% of C++ online submissions for Distant Barcodes.
```