# sliding-window-median

[https://leetcode.com/problems/sliding-window-median/](https://leetcode.com/problems/sliding-window-median/)

```
Median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle value.

Examples: 
[2,3,4] , the median is 3

[2,3], the median is (2 + 3) / 2 = 2.5

Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position. Your job is to output the median array for each window in the original array.

For example,
Given nums = [1,3,-1,-3,5,3,6,7], and k = 3.

Window position                Median
---------------               -----
[1  3  -1] -3  5  3  6  7       1
 1 [3  -1  -3] 5  3  6  7       -1
 1  3 [-1  -3  5] 3  6  7       -1
 1  3  -1 [-3  5  3] 6  7       3
 1  3  -1  -3 [5  3  6] 7       5
 1  3  -1  -3  5 [3  6  7]      6
Therefore, return the median sliding window as [1,-1,-1,3,5,6].

Note: 
You may assume k is always valid, ie: k is always smaller than input array's size for non-empty array.
```

# thinking

和 [[Hard]find-median-from-data-stream - 寻找数据流的中位数](https://github.com/xuwenzhi/leetcode/blob/master/design/find-median-from-data-stream.md) 几乎是一样的，不过使用的滑动窗口来解决，最开始也是想通过两个最小堆解决问题，不过由于最小堆很难无法快速定位到滑走的数，比如 case

[1,3,-1,-3]
3

当想在最小堆中移除 1 这个元素时，无法快速定位，所以本题中是需要一个能够快速定位元素的数据结构，而且支持存储多个相同key的值的，所以就采用了multiset这种结构，其实multimap也是可以的，multiset解决问题会更精准一点。


# solution(multiset)

```c++
class Solution {
public:
    vector<double> medianSlidingWindow(vector<int>& nums, int k) {
        vector<double> res;
        multiset<double> ms(nums.begin(), nums.begin()+k);
        auto mid = next(ms.begin(), k/2);
        for (int i=k;;i++) {
            // 计算k个数的中位数
            double median = (*mid + *(prev(mid, 1-k%2)))/2; 
            res.push_back(median);
            // 达到nums个数，返回结果
            if (i == nums.size()) return res;
            ms.insert(nums[i]);
            // 如果新滑到的数小于中位数，mid指针--
            if (nums[i] < *mid) mid--;
            // 如果滑走的数小于等于中位数，mid指针++
            if (nums[i-k] <= *mid) mid++;
            // multiset删除滑走的数
            ms.erase(ms.lower_bound(nums[i-k]));
        }
        
        return res;
    }
};
//Runtime: 56 ms, faster than 99.35% of C++ online submissions for Sliding Window Median.
//Memory Usage: 15.5 MB, less than 54.28% of C++ online submissions for Sliding Window Median.
```