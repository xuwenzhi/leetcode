# two-sum

[https://leetcode.com/problems/two-sum/](https://leetcode.com/problems/two-sum/)

```
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
```

# thinking

第一种就是brute force，那样的话，O(n) Runtime, O(1) Space，不过还有其他的方式，使用hashmap，存储遍历过的点，然后进行匹配。

# solution (ruby)

```ruby
# coding: utf-8
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  result = [0, 0];
  for index in 0..nums.length-1
    if (nums.include?(target-nums[index]))
      other_index = nums.index(target-nums[index])
      if (index != other_index)
        return [index, other_index]
      end
    end
  end
  result
end
```

# solution (c++ hashmap)

```c++
// O(n) Runtime O(n) Space
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int,int> m;
        for (int i=0; i<nums.size(); i++) {
            if (m.find(target - nums[i]) != m.end()) {
                return {m[target-nums[i]], i};
            }
            m.insert({nums[i], i});
        }

        return {0, 0};
    }
};
//Runtime: 4 ms, faster than 99.72% of C++ online submissions for Two Sum.
//Memory Usage: 10.1 MB, less than 50.95% of C++ online submissions for Two Sum.
```
