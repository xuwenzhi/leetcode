# queue-reconstruction-by-height

[https://leetcode.com/problems/queue-reconstruction-by-height/](https://leetcode.com/problems/queue-reconstruction-by-height/)

```
Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.

Note:
The number of people is less than 1,100.


Example

Input:
[[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]

Output:
[[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
```

# thinking
这个题本身就比较难理解，不过在评论区找到一个比较精辟的解释 "矮子插队无所谓，反正高个子看不到" ，嗯，这样就比较容易理解了。

Note:
1. 题目中明确表示给出的case一定都满足条件
2. 数据量最大为1100

# solution 

论坛里的解法基本上都是做排序，然后再插入。以case "[[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]" 为例

sort之后 : "[7,0],[7,1],[6,1],[5,0],[5,2],[4,4]"

然后在按照这样的方式插入 **res.insert(res.begin() + p[1], p);**

**题目中明确表示给出的case一定都满足条件** 这个条件题目是一定会满足的，要不然这个方案也是行不通的，比如把 [7,1] 改为 [7,2] 就GG了。

嗯，我是想不出来这东西~

```c++
// O(n^2) Runtime, O(1) Space.
class Solution {
public:
    vector<vector<int>> reconstructQueue(vector<vector<int>>& people) {
        auto compare = [](auto const &a, auto const &b) {
            return a[0] > b[0] || (a[0] == b[0] && a[1] < b[1]);
        };
        sort(people.begin(), people.end(), compare);

        vector<vector<int>> res;
        for (auto& p : people) 
            res.insert(res.begin() + p[1], p);
        
        return res;
    }
};
//Runtime: 84 ms, faster than 44.14% of C++ online submissions for Queue Reconstruction by Height.
//Memory Usage: 12.5 MB, less than 24.73% of C++ online submissions for Queue Reconstruction by Height.
```

# rethinking

还有一种是用priority_queue来做，基本上思路也是一样的，先做排序，最后的插入使用的。

# refer

[6 lines  Concise C++](https://leetcode.com/problems/queue-reconstruction-by-height/discuss/89348/)