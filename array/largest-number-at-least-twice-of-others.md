# largest-number-at-least-twice-of-others

[https://leetcode.com/problems/largest-number-at-least-twice-of-others/](https://leetcode.com/problems/largest-number-at-least-twice-of-others/)

```
In a given integer array nums, there is always exactly one largest element.

Find whether the largest element in the array is at least twice as much as every other number in the array.

If it is, return the index of the largest element, otherwise return -1.

Example 1:

Input: nums = [3, 6, 1, 0]
Output: 1
Explanation: 6 is the largest integer, and for every other number in the array x,
6 is more than twice as big as x.  The index of value 6 is 1, so we return 1.
 

Example 2:

Input: nums = [1, 2, 3, 4]
Output: -1
Explanation: 4 isn't at least as big as twice the value of 3, so we return -1.
 

Note:

nums will have a length in the range [1, 50].
Every nums[i] will be an integer in the range [0, 99].
```

# solution (map)
// O(nlogn) Runtime, O(n) Space.
```c++
class Solution {
public:
    int dominantIndex(vector<int>& nums) {
        if (nums.size() == 1) return 0;
        
        map<int, int, greater<int>> m;
        for (int i=0;i<nums.size();i++) {
            m.insert({nums[i], i});
        }
        
        map<int,int,greater<int>>::iterator it = m.begin();
        int a = it->first;
        int aa = it->second;
        
        it++;
        int b = it->first;
        
        return a >= b*2 ? aa : -1;
    }
};
//Runtime: 4 ms, faster than 84.95% of C++ online submissions for Largest Number At Least Twice of Others.
//Memory Usage: 8.9 MB, less than 34.97% of C++ online submissions for Largest Number At Least Twice of Others.
```