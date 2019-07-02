# sort-an-array

[https://leetcode.com/problems/sort-an-array/](https://leetcode.com/problems/sort-an-array/)

```
Given an array of integers nums, sort the array in ascending order.

 

Example 1:

Input: [5,2,3,1]
Output: [1,2,3,5]
Example 2:

Input: [5,1,1,2,0,0]
Output: [0,0,1,1,2,5]
 

Note:

1 <= A.length <= 10000
-50000 <= A[i] <= 50000
```

# solution (stl::sort())

STL的sort()设计的甚是精妙，是一种 **内省式排序** 的典型实现，综合了快排、堆排以及插入排序各自的优点而来。

详细了解可以看这篇文章[知无涯之std::sort源码剖析](http://feihu.me/blog/2014/sgi-std-sort/)

```c++
class Solution {
public:
    vector<int> sortArray(vector<int>& nums) {
        vector<int> res = nums;
        sort(res.begin(), res.end());
        
        return res;
    }
};
//Runtime: 56 ms, faster than 94.86% of C++ online submissions for Sort an Array.
//Memory Usage: 12.5 MB, less than 64.89% of C++ online submissions for Sort an Array.
```

# solution (quick sort 双向循环法)

```c++
class Solution {
public:
    void quickSort(vector<int>& nums, int left, int right) {
        if (left >= right) return;
        int pivot = nums[left];
        int i=left, j=right;
        while (i < j) {
            while (j>i && nums[j] > pivot) j--;
            
            if (i < j) nums[i++] = nums[j];
            
            while (i<j && nums[i] <= pivot) i++;
            
            if (i < j) nums[j--] = nums[i];
        }
        nums[i] = pivot;
        quickSort(nums, left, i-1);
        quickSort(nums, i+1, right);
    }
    
    vector<int> sortArray(vector<int>& nums) {
        quickSort(nums, 0, nums.size()-1);
        
        return nums;
    }
};
//Runtime: 60 ms, faster than 88.80% of C++ online submissions for Sort an Array.
//Memory Usage: 12.7 MB, less than 48.47% of C++ online submissions for Sort an Array.
```

# solution (quick sort 单向循环法)

```c++
class Solution {
public:
    void quickSort(vector<int>& nums, int left, int right) {
        if (left >= right) return;
        int pivot = nums[left];
        int mark = left, i=left, j=right;
        for (int i=left+1;i<=right;i++) {
            if (nums[i] < pivot) {
                mark++;
                swap(nums[i], nums[mark]);
            }
        }
        
        nums[left] = nums[mark];
        nums[mark] = pivot;
        
        quickSort(nums, left, mark-1);
        quickSort(nums, mark+1, right);
    }
    
    vector<int> sortArray(vector<int>& nums) {
        quickSort(nums, 0, nums.size()-1);
        
        return nums;
    }
};
//Runtime: 64 ms, faster than 71.40% of C++ online submissions for Sort an Array.
//Memory Usage: 12.6 MB, less than 61.55% of C++ online submissions for Sort an Array.
```


# solution (heap sort)

而同为稳定O(nlogn)的堆排序，效率真是差的不是一点半点了。

```c++
class Solution {
public:
    void heapify(vector<int>& nums, int length, int i) {
        int largest = i;
        int l = 2 * i + 1, r = 2 * i + 2;
        if (l < length && nums[l] > nums[largest]) largest = l;
        if (r < length && nums[r] > nums[largest]) largest = r;
        
        if (largest != i) {
            swap(nums[i], nums[largest]);
            heapify(nums, length, largest);
        }
    }
    
    void heapSort(vector<int>& nums) {
        int length = nums.size();
        for (int i=length/2-1;i>=0;i--) {
            heapify(nums, length, i);
        }
        
        for (int i=length-1;i>=0;i--) {
            swap(nums[i], nums[0]);
            heapify(nums, i, 0);
        }
    }
    
    vector<int> sortArray(vector<int>& nums) {
        heapSort(nums);
        return nums;
    }
};
//Runtime: 84 ms, faster than 18.90% of C++ online submissions for Sort an Array.
//Memory Usage: 12.5 MB, less than 65.56% of C++ online submissions for Sort an Array.
```