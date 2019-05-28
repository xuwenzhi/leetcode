# contains-duplicate-iii

[https://leetcode.com/problems/contains-duplicate-iii/](https://leetcode.com/problems/contains-duplicate-iii/)

```
Given an array of integers, find out whether there are two distinct indices i and j in the array such that the absolute difference between nums[i] and nums[j] is at most t and the absolute difference between i and j is at most k.

Example 1:

Input: nums = [1,2,3,1], k = 3, t = 0
Output: true
Example 2:

Input: nums = [1,0,1,1], k = 1, t = 2
Output: true
Example 3:

Input: nums = [1,5,9,1,5,9], k = 2, t = 3
Output: false
```

# thinking

这个题跟前两个版本完全不同，做了前两个被hashtable搞进去之后，脑子就转不回来了。。

# solution (hashtable)

很不幸，超时了。

```c++
class Solution {
public:
    bool containsNearbyAlmostDuplicate(vector<int>& nums, int k, int t) {
        unordered_map<int,int> m;
        int l = nums.size();
        for (int i=0;i<l;i++) {
            int cur = nums[i];
            vector<int> tmp;
            for (auto a:m) {
                if (i - a.second > k) {
                    tmp.push_back(a.first);
                    continue;
                }
                if (abs((long)a.first-cur) <= t) return true;
            }
            for (auto i:tmp) {
                m.erase(i);
            }
            
            m[nums[i]] = i;
        }
        
        return false;
    }
};
```

# solution (map) 

使用map存储数组的value-key，并且使用两个指针**i,j**，i在前，j在后，两者**相距k**,
使用map的好处是可以直接定位到 **nums[i] - t** 这个位置，因为map是排序的。

```c++
class Solution {
public:
    bool containsNearbyAlmostDuplicate(vector<int>& nums, int k, int t) {
        map<long, int> m;
        int l = nums.size();
        for (int i=0,j=0;i<l;i++) {
            if (i - j > k) m.erase(nums[j++]);
            auto it = m.lower_bound((long)nums[i]-t);
            if (it != m.end() && abs(it->first - nums[i]) <= t) return true;
            m[nums[i]] = i;
        }
        
        return false;
    }
};
//Runtime: 16 ms, faster than 93.66% of C++ online submissions for Contains Duplicate III.
//Memory Usage: 11.1 MB, less than 8.04% of C++ online submissions for Contains Duplicate III.
```

# points

## [map](http://www.cplusplus.com/reference/map/map/) 

- map.erase(key);

- map.lower_bound(value);

# refer

[[LeetCode] Contains Duplicate III 包含重复值之三](https://www.cnblogs.com/grandyang/p/4545261.html)