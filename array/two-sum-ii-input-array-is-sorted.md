# two-sum-ii-input-array-is-sorted

[https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)

```
Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.

Note:

Your returned answers (both index1 and index2) are not zero-based.
You may assume that each input would have exactly one solution and you may not use the same element twice.
Example:

Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
```

# thinking

这个和[[Easy]2sum](https://github.com/xuwenzhi/leetcode/blob/master/array/2sum.md)一个味道，解决方案如果不考虑排序其实是一样的，不过那既然已经排序了，解决方案肯定会和**2 pointer**有关了.


# solution (ruby)

```ruby
// O(logN) Runtime O(1) Space
# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  low = 0;
  high = numbers.length - 1;
  while (low < high)
    if (numbers[low] + numbers[high] == target)
      return [low + 1, high + 1]
    elsif (numbers[low] + numbers[high] < target)
      low = low + 1
    else
      high = high - 1
    end
  end
end
```

# solution (c++)

```c++
// O(logN) Runtime O(1) Space
class Solution {
public:
    vector<int> twoSum(vector<int>& numbers, int target) {
        int low=0, high = numbers.size()-1;
        while (low < high) {
            int mid = low + (high - low) / 2;
            int sum = numbers[low] + numbers[high];
            if (sum == target) {
                return {low+1, high+1};
            } else if(sum < target) {
                low ++;
            } else {
                high --;
            }
        }
        return {};
    }
};
//Runtime: 8 ms, faster than 99.20% of C++ online submissions for Two Sum II - Input array is sorted.
//Memory Usage: 9.6 MB, less than 37.56% of C++ online submissions for Two Sum II - Input array is sorted.
```
