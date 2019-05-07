# kth-largest-element-in-an-array

[https://leetcode.com/problems/kth-largest-element-in-an-array/](https://leetcode.com/problems/kth-largest-element-in-an-array/)


```
Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

Example 1:

Input: [3,2,1,5,6,4] and k = 2
Output: 5
Example 2:

Input: [3,2,3,1,2,4,5,5,6] and k = 4
Output: 4
Note:
You may assume k is always valid, 1 ≤ k ≤ array's length.
```

# solution (sort)

```c++
// O(nlogn) Runtime, O(1) Space.
class Solution {
public:
    int findKthLargest(vector<int>& nums, int k) {
        sort(nums.begin(), nums.end());

        return nums[nums.size()-k];
    }
};
//Runtime: 16 ms, faster than 64.94% of C++ online submissions for Kth Largest Element in an Array.
//Memory Usage: 9.4 MB, less than 67.47% of C++ online submissions for Kth Largest Element in an Array.
```

# solution (nth-element)

使用C++内置的函数**nth-element()**，会将数组中的nth大的数字安排在数组的nth那个位置.

```c++
class Solution {
public:
    int findKthLargest(vector<int>& nums, int k) {
        nth_element (nums.begin(), nums.end()-k, nums.end());

        return nums[nums.size()-k];
    }
};
//Runtime: 8 ms, faster than 99.55% of C++ online submissions for Kth Largest Element in an Array.
//Memory Usage: 9.4 MB, less than 79.71% of C++ online submissions for Kth Largest Element in an Array.
```

# solution (partial_sort)

使用C++内置的函数**partial_sort()**，会对数组的前一部分进行排序，进而也可以得到结果.

```c++
class Solution {
public:
    int findKthLargest(vector<int>& nums, int k) {
        partial_sort(nums.begin(), nums.end()-k+1, nums.end());

        return nums[nums.size()-k];
    }
};
//Runtime: 12 ms, faster than 97.22% of C++ online submissions for Kth Largest Element in an Array.
//Memory Usage: 9.4 MB, less than 73.43% of C++ online submissions for Kth Largest Element in an Array.
```

# solution (min heap)

这里采用最小堆来实现，因为最小堆本身就有插入自动排序的特性，那么遍历数组然后插入到heap中，并且在heap.size() > k之后 heap.pop(),那么最后留在heap中的就是 n-k个最大的数，而我们要的结果就在堆顶~

```c++
// O(nlogn) Runtime, O(k) Space.
class Solution {
public:
    int findKthLargest(vector<int>& nums, int k) {
        priority_queue<int, vector<int>, greater<int>> q{};

        for (int i=0;i<nums.size();i++) {
            q.push(nums[i]);
            if (q.size() > k) {
                q.pop();
            }
        }

        return q.top();
    }
};
//Runtime: 20 ms, faster than 45.80% of C++ online submissions for Kth Largest Element in an Array.
//Memory Usage: 9.6 MB, less than 40.42% of C++ online submissions for Kth Largest Element in an Array.
```
