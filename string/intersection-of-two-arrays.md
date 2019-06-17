# intersection-of-two-arrays

[https://leetcode.com/problems/intersection-of-two-arrays/](https://leetcode.com/problems/intersection-of-two-arrays/)

```
Given two arrays, write a function to compute their intersection.

Example 1:

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2]
Example 2:

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [9,4]
Note:

Each element in the result must be unique.
The result can be in any order.
```

# solution (hashtable)

```c++ 
// O(m+n) Runtime, O(m+n) Space.
class Solution {
public:
    vector<int> intersection(vector<int>& nums1, vector<int>& nums2) {
        unordered_map<int,int> m1, m2;
        for (auto i:nums1) {
            m1[i]++;
        }
        for (auto i:nums2) {
            m2[i]++;
        }
        
        vector<int> res;
        if (m1.size() >= m2.size()) {
            for (auto i:m1) {
                if (m2.count(i.first) > 0) {
                    res.push_back(i.first);
                }
            }
        } else {
            for (auto i:m2) {
                if (m1.count(i.first) > 0) {
                    res.push_back(i.first);
                }
            }
        }
        
        return res;
    }
};
//Runtime: 4 ms, faster than 99.64% of C++ online submissions for Intersection of Two Arrays.
//Memory Usage: 9.9 MB, less than 5.01% of C++ online submissions for Intersection of Two Arrays.
```