# intersection-of-two-arrays-ii

[https://leetcode.com/problems/intersection-of-two-arrays-ii/](https://leetcode.com/problems/intersection-of-two-arrays-ii/)

```
Given two arrays, write a function to compute their intersection.

Example 1:

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]
Example 2:

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Note:

Each element in the result should appear as many times as it shows in both arrays.
The result can be in any order.
Follow up:

What if the given array is already sorted? How would you optimize your algorithm?
What if nums1's size is small compared to nums2's size? Which algorithm is better?
What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
```

# solution 

```c++
// O(m+n) Runtime, O(m+n) Space.
class Solution {
public:
    vector<int> intersect(vector<int>& nums1, vector<int>& nums2) {
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
                    int tmp = min(m2[i.first], i.second);
                    while (tmp > 0) {
                        res.push_back(i.first);
                        tmp--;
                    }
                }
            }
        } else {
            for (auto i:m2) {
                if (m1.count(i.first) > 0) {
                    int tmp = min(m1[i.first], i.second);
                    while (tmp > 0) {
                        res.push_back(i.first);
                        tmp--;
                    }
                }
            }
        }
        
        return res;
    }
};
//Runtime: 8 ms, faster than 90.36% of C++ online submissions for Intersection of Two Arrays II.
//Memory Usage: 9.8 MB, less than 6.95% of C++ online submissions for Intersection of Two Arrays II.
```