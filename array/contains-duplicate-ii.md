# contains-duplicate-ii

[https://leetcode.com/problems/contains-duplicate-ii/](https://leetcode.com/problems/contains-duplicate-ii/)

```
Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.

Example 1:

Input: nums = [1,2,3,1], k = 3
Output: true
Example 2:

Input: nums = [1,0,1,1], k = 1
Output: true
Example 3:

Input: nums = [1,2,3,1,2,3], k = 2
Output: false
```

# solution

在hashtable中记录这个数字上一次出现的下标，然后再比较就可以了。

```c++
// O(n) Runtime, O(n) Space.
class Solution {
public:
    bool containsNearbyDuplicate(vector<int>& nums, int k) {
        unordered_map<int,int> m;
        for (int i=0;i<nums.size();i++) {
            if (m.count(nums[i])) {
                if (i - m[nums[i]] <= k) {
                    return true;
                }
            }
            m[nums[i]] = i;
        }
        
        return false;
    }
};
//Runtime: 28 ms, faster than 95.68% of C++ online submissions for Contains Duplicate II.
//Memory Usage: 15.7 MB, less than 6.58% of C++ online submissions for Contains Duplicate II.
```