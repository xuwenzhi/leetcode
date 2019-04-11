# 3 sum

[https://leetcode.com/problems/3sum/](https://leetcode.com/problems/3sum/)

```
Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]
```

# thinking

果断 **2 pointer解决**

# solution

```php
# O(NLogN) Runtime O(1) Space
# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  result = []
  nums.sort!

  for index in 0..nums.length-1 do
    low = index + 1
    high = nums.length - 1
    while (low < high)
      sum = 0 - nums[index]
      if (sum == nums[low] + nums[high]) then
        result[result.length] = [nums[index], nums[low], nums[high]]
        while (low < high && nums[low] == nums[low+1])
          low = low + 1
        end
        while (low < high && nums[high] == nums[high-1])
          high=high - 1
        end
        low = low + 1
        high = high - 1
      elsif (sum < nums[low] + nums[high])
        high = high - 1
      else
        low = low + 1
      end
    end
  end
  result.uniq
end
```
