# majority-element

[https://leetcode.com/problems/majority-element/](https://leetcode.com/problems/majority-element/)

```
Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

You may assume that the array is non-empty and the majority element always exist in the array.

Example 1:

Input: [3,2,3]
Output: 3
Example 2:

Input: [2,2,1,1,1,2,2]
Output: 2
```

# thinking

这道题计算的是出现次数最多的那个元素，所以如果使用**暴力方案**的话，时间复杂度为 O(n^2)。由于数组中元素范围不确定，所以不能使用数组，所以我的第一个方案是使用**HashTable**解决。

另外注意到majority element的数量一定大于数组长度的一半，所以还有**Sort(O(nlogn)Time取决于语言内置的排序算法)**方案，如果将数组排序，那么出现在数组中间的那个值也就是答案了。

当然还有更优质的代码，叫做**摩尔投票算法**，采用为元素计数的方式，因为目标元素的个数必然会大于 n/2 ,当遍历数组时，是目标元素就**+1**,否则就**-1**，则最后存在的就是目标元素，算法建下方

# solution (HashTable)

```c++
// O(n) Runtime, O(n) Space.
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        unordered_map<int,int> map{};
        for (int i=0;i<nums.size();i++) {
            if (map.count(nums[i])) map[nums[i]]++;
            else map[nums[i]]=1;
        }

        int majority = 0, majorCount=0;
        for (auto i : map) {
            if (i.second > majorCount) {
                majority = i.first;
                majorCount = i.second;
            }
        }

        return majority;
    }
};
//Runtime: 24 ms, faster than 62.12% of C++ online submissions for Majority Element.
//Memory Usage: 11.2 MB, less than 76.55% of C++ online submissions for Majority Element.
```

# solution (摩尔投票算法)

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        int m,count = 0;
        for (int i=0;i<nums.size();i++) {
            if (count == 0) {
                m = nums[i];
                count = 0;
            }
            if (nums[i] != m) {
                count--;
            } else {
                count++;
            }
        }

        return m;
    }
};
//Runtime: 20 ms, faster than 98.64% of C++ online submissions for Majority Element.
//Memory Usage: 11.2 MB, less than 63.50% of C++ online submissions for Majority Element.
```
