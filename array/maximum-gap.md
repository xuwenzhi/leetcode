# maximum-gap

[https://leetcode.com/problems/maximum-gap/](https://leetcode.com/problems/maximum-gap/)

```
Given an unsorted array, find the maximum difference between the successive elements in its sorted form.

Return 0 if the array contains less than 2 elements.

Example 1:

Input: [3,6,9,1]
Output: 3
Explanation: The sorted form of the array is [1,3,6,9], either
             (3,6) or (6,9) has the maximum difference 3.
Example 2:

Input: [10]
Output: 0
Explanation: The array contains less than 2 elements, therefore return 0.
Note:

You may assume all elements in the array are non-negative integers and fit in the 32-bit signed integer range.
Try to solve it in linear time/space.
```

# thinking

这道题是采用桶排序来做的，搞成一个个的区间，然后把对应的元素设置到对应的桶里，然后对桶内进行排序就完了。

### 那么为什么不采用其他排序？比如计数排序，或者什么样的数据样本采用桶排序？

1. 数据范围较大
2. 分布不确定

### 桶排序的注意点 :桶的个数以及大小的计算需要注意

1. 区间范围大小 : **int bucket_size = max(1, (ma-mi)/((nums.size()-1)));** 这里一定至少要为1，假如样本为[1,1,1,1]的话，bucket_size就为0了。
2. 桶的个数 : int bucket_count = (ma - mi) / bucket_size + 1;****

> 在 n 个数下，形成的两两相邻区间是 n - 1 个，比如 [2,4,6,8] 这里有 4 个数，但是只有 3 个区间，[2,4], [4,6], [6,8]。因此，桶长度 = 区间总长度 / 区间总个数 = (max - min) / (nums.length - 1)，这样得到桶的范围为2

> 这里考虑到实现的方便，多加了一个桶，为什么？但是如果要说根本原因，其实是开闭区间的问题，这里其实 0,1,2 号桶对应的区间是 [2,4),[4,6),[6,8)。那 8 怎么办？多加一个桶呗，3 号桶对应区间 [8,10)

# solution 

```c++
class Solution {
public:
    int maximumGap(vector<int>& nums) {
        if (nums.size() < 2) return 0;
        int mi = INT_MAX, ma = INT_MIN, res = 0;
        for (int i : nums) {
            mi = min(i, mi);
            ma = max(ma, i);
        }
        
        int bucket_size = (ma-mi)/((nums.size()-1)); //每个区间的范围
        bucket_size = bucket_size < 1 ? 1 : bucket_size;
        int bucket_count = (ma - mi) / bucket_size + 1; //多少个区间
        
        vector<vector<int>> buckets(bucket_count);
        for (int n:nums) {
            buckets[(n-mi)/bucket_size].push_back(n);
        }
        
        for (auto &b : buckets) {
            sort(b.begin(), b.end());
        }
       
        int pre_max = INT_MAX;
        for (int i=0;i<buckets.size();i++) {
            for (int j=0;j<buckets[i].size();j++) {
                res = max(res, buckets[i][j] - pre_max);
                pre_max = buckets[i][j];
            }
        }
        
        return res;
    }
};
//Runtime: 16 ms, faster than 20.86% of C++ online submissions for Maximum Gap.
//Memory Usage: 10.5 MB, less than 12.91% of C++ online submissions for Maximum Gap.
```

# refer

[Hard 级别难度？桶排序几行代码搞定！](https://mp.weixin.qq.com/s/xHxjCDdFZyCW2pnY6Cz8SQ)