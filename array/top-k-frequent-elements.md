# top-k-frequent-elements

[https://leetcode.com/problems/top-k-frequent-elements/](https://leetcode.com/problems/top-k-frequent-elements/)

```
Given a non-empty array of integers, return the k most frequent elements.

Example 1:

Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]
Example 2:

Input: nums = [1], k = 1
Output: [1]
Note:

You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
```

# solution (hashtable + multimap)

首先用hashtable把数字及数字对应的次数统计出来，然后再将<数字出现的次数，数字>推入到multimap中，每次推完检查 **multimap.size() > k** ，如果满足，推出multimap的第一个pair，最后存在multimap中的pair即结果。

```c++
// O(nlogn) Runtime, O(n) Space.
class Solution {
public:
    vector<int> topKFrequent(vector<int>& nums, int k) {
        unordered_map<int,int> m;
        multimap<int,int> map;
        
        for (int i=0;i<nums.size();i++) {
            m[nums[i]]++;
        }
        
        vector<int> res;
        for (auto i:m) {
            map.insert(std::pair<int,int>(i.second,i.first));
            if (map.size() > k) {
                map.erase(map.begin());
            }
        }

        for (auto i:map) {
            res.push_back(i.second);
        }
        return res;
    }
};
//Runtime: 16 ms, faster than 97.90% of C++ online submissions for Top K Frequent Elements.
//Memory Usage: 11.9 MB, less than 15.50% of C++ online submissions for Top K Frequent Elements.
```