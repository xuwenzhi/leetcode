# degree-of-an-array

[https://leetcode.com/problems/degree-of-an-array/](https://leetcode.com/problems/degree-of-an-array/)

```
Given a non-empty array of non-negative integers nums, the degree of this array is defined as the maximum frequency of any one of its elements.

Your task is to find the smallest possible length of a (contiguous) subarray of nums, that has the same degree as nums.

Example 1:

Input: [1, 2, 2, 3, 1]
Output: 2
Explanation: 
The input array has a degree of 2 because both elements 1 and 2 appear twice.
Of the subarrays that have the same degree:
[1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
The shortest length is 2. So return 2.
Example 2:

Input: [1,2,2,3,1,4,2]
Output: 6
Note:

nums.length will be between 1 and 50,000.
nums[i] will be an integer between 0 and 49,999.
```

# thinking

这个题吧，怎么理解起来还真是有点奇怪，分为两步

统计出数组中出现元素的次数，
1. 如果仅有一个次数最多的，那么就返回这个数字出现的收尾位置的间隔
2. 如果次数最多的数字有多个，那么返回这些数字收尾间隔的最小值

嗯，就这么回事。


# solution (multimap)

这个方案是使用multimap，k-v分别对应数字以及数字所对应的下标，这样在存储完成之后，遍历map，需要维护一个frequency这样的变量，来处理，仅有一个次数最多的和有多个出现次数相同的情况。

比如这个case [1,2,2,3,1,4,2]，遍历map是这样的

1 -> 0
1 -> 4
2 -> 1
2 -> 2 
2 -> 6
3 -> 3
4 -> 5

```c++
class Solution {
public:
    int findShortestSubArray(vector<int>& nums) {
        if (nums.size() == 0) return 0;
        multimap<int,int> m;
        for (int i=0;i<nums.size();i++) {
            m.insert({nums[i], i});
        }
        
        int res = INT_MAX;
        int frequency = 0;
        
        multimap<int,int>::iterator it = m.begin();
        for (;it!=m.end();) {
            int start = it->second;
            int end = start;
            int tmp = it->first;
            int freq = 0;
            while (it != m.end() && it->first == tmp) {
                freq++;
                end = it->second;
                it++;
            }
            if (freq > frequency) {
                frequency = freq;
                res = end - start + 1;
            } else if (freq == frequency) {
                res = min(res, end - start + 1);
            }
            
            if (it == m.end()) break;
        }
        
        return res;
    }
};
//Runtime: 84 ms, faster than 12.14% of C++ online submissions for Degree of an Array.
//Memory Usage: 25 MB, less than 5.02% of C++ online submissions for Degree of an Array.
```


# solution (hashtable)

这种方案是建立一个Hashtable来解决 **unordered_map<int, vector<int>> m;** key为具体数字，value是大小固定为3的vector<int>，vector中第一和第二个元素存储，该元素下标的起始和终止位置，第三个元素用于存储元素出现次数。

这样构造好这个Hashtable之后，直接来一次遍历即可解决问题了。

```c++
// O(n) Runtime, O(n) Space.
class Solution {
public:
    int findShortestSubArray(vector<int>& nums) {
        if (nums.size() == 0) return 0;
        unordered_map<int, vector<int>> m;
        for (int i=0;i<nums.size();i++) {
            if (m.count(nums[i])) {
                m[nums[i]][1] = i;
                m[nums[i]][2]++;
            } else {
                vector<int> tmp(3, 0);
                tmp[0] = i;
                tmp[2]++;
                m.insert({nums[i], tmp});
            }
        }
        
        int freq = 0;
        int res = INT_MAX;
        for (auto i : m) {
            int gap = i.second[1] - i.second[0] + 1;
            gap = gap > 0 ? gap : 1;
            if (i.second[2] > freq) {
                freq = i.second[2];
                res  = gap;
            } else if (i.second[2] == freq) {
                res = min(res, gap);
            }
        }
        
        return res;
    }
};
//Runtime: 40 ms, faster than 83.53% of C++ online submissions for Degree of an Array.
//Memory Usage: 14.2 MB, less than 28.46% of C++ online submissions for Degree of an Array.
```
