# contains-duplicate

[https://leetcode.com/problems/contains-duplicate/](https://leetcode.com/problems/contains-duplicate/)

```
Given an array of integers, find if the array contains any duplicates.

Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

Example 1:

Input: [1,2,3,1]
Output: true
Example 2:

Input: [1,2,3,4]
Output: false
Example 3:

Input: [1,1,1,3,3,4,3,2,4,2]
Output: true
```

# solution 

用个hashtable存一下就完了，真是有点像two-num啊！

```c++
class Solution {
public:
    bool containsDuplicate(vector<int>& nums) {
        unordered_map<int,bool> m;
        for (auto i:nums) {
            if (m[i]) {
                return true;
            }
            m[i] = true;
        }
        
        return false;
    }
};
//Runtime: 36 ms, faster than 81.25% of C++ online submissions for Contains Duplicate.
//Memory Usage: 16.6 MB, less than 26.35% of C++ online submissions for Contains Duplicate.
```