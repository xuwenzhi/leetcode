# next-greater-element-i

[https://leetcode.com/problems/next-greater-element-i/](https://leetcode.com/problems/next-greater-element-i/)

```
You are given two arrays (without duplicates) nums1 and nums2 where nums1’s elements are subset of nums2. Find all the next greater numbers for nums1's elements in the corresponding places of nums2.

The Next Greater Number of a number x in nums1 is the first greater number to its right in nums2. If it does not exist, output -1 for this number.

Example 1:

Input: nums1 = [4,1,2], nums2 = [1,3,4,2].
Output: [-1,3,-1]
Explanation:
    For number 4 in the first array, you cannot find the next greater number for it in the second array, so output -1.
    For number 1 in the first array, the next greater number for it in the second array is 3.
    For number 2 in the first array, there is no next greater number for it in the second array, so output -1.
Example 2:

Input: nums1 = [2,4], nums2 = [1,2,3,4].
Output: [3,-1]
Explanation:
    For number 2 in the first array, the next greater number for it in the second array is 3.
    For number 4 in the first array, there is no next greater number for it in the second array, so output -1.
Note:

All elements in nums1 and nums2 are unique.
The length of both nums1 and nums2 would not exceed 1000.
```

# thinking

想象一段降序序列[5,4,3,2,1,6], 其中[5,4,3,2,1]的目标值都是6，因为6是右侧第一个大于本身的数字，所以根据这种思路，用一个栈存储[5,4,3,2,1]，当遇到6时，需要挨个pop()，并保存在一个map里就好了。


# solution
```
class Solution {
public:
    vector<int> nextGreaterElement(vector<int>& nums1, vector<int>& nums2) {
        int nums1Len = nums1.size();
        if (nums1Len == 0) return nums1;
        unordered_map<int, int> map;
        stack<int> s{};
        int nums2Len = nums2.size();
        for (int i = 0; i < nums2Len; i++) {
            while (s.size() && s.top() < nums2[i]) {
                map.insert(std::make_pair(s.top(), nums2[i]));
                s.pop();
            }
            
            s.push(nums2[i]);
        }
        
        vector<int> res{};
        for (int i = 0; i < nums1Len; i++) {
            if (map.find(nums1[i]) != map.end()) {
                res.push_back(map.at(nums1[i]));
            } else {
                res.push_back(-1);   
            }
        }
        return res;
    }
};
```

Runtime: 12 ms, faster than 99.06% of C++ online submissions for Next Greater Element I.

Memory Usage: 9.2 MB, less than 83.87% of C++ online submissions for Next Greater Element I.
