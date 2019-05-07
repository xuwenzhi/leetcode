# third-maximum-number

[https://leetcode.com/problems/third-maximum-number/](https://leetcode.com/problems/third-maximum-number/)

```
Given a non-empty array of integers, return the third maximum number in this array. If it does not exist, return the maximum number. The time complexity must be in O(n).

Example 1:

Input: [3, 2, 1]

Output: 1

Explanation: The third maximum is 1.
Example 2:

Input: [1, 2]

Output: 2

Explanation: The third maximum does not exist, so the maximum (2) is returned instead.
Example 3:

Input: [2, 2, 3, 1]

Output: 1

Explanation: Note that the third maximum here means the third maximum distinct number.
Both numbers with value 2 are both considered as second maximum.
```

# solution (sort & unique)

做一次排序然后再做一次去重，如果长度是>=3的，直接返回倒数第三个元素即可，否则返回最大值.

```c++
class Solution {
public:
    int thirdMax(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        std::vector<int>::iterator it = unique(nums.begin(), nums.end());
        nums.resize( std::distance(nums.begin(),it));

        int l = nums.size();

        if (l < 3) return *max_element(nums.begin(), nums.end());

        return nums[l-3];
    }
};
//Runtime: 12 ms, faster than 54.75% of C++ online submissions for Third Maximum Number.
//Memory Usage: 9.2 MB, less than 71.77% of C++ online submissions for Third Maximum Number.
```


# solution (Set)

使用Set天生就排序的特点来解决这个问题更加.

```c++
class Solution {
public:
    int thirdMax(vector<int>& nums) {
        set<int> s;
        for (int i=0;i<nums.size();i++) {
            s.insert(nums[i]);
            if (s.size() > 3) {
                s.erase(s.begin());
            }
        }

        return s.size() < 3 ? *s.rbegin() : *s.begin();
    }
};
//Runtime: 12 ms, faster than 54.75% of C++ online submissions for Third Maximum Number.
//Memory Usage: 10.7 MB, less than 23.38% of C++ online submissions for Third Maximum Number.
```
