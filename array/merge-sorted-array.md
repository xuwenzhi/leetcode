# merge-sorted-array

[https://leetcode.com/problems/merge-sorted-array/](https://leetcode.com/problems/merge-sorted-array/)

```
Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

Note:

The number of elements initialized in nums1 and nums2 are m and n respectively.
You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
Example:

Input:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

Output: [1,2,2,3,5,6]
```

# thinking

就按顺序搞就完了，主要注意点在代码里吧算是.

# solution

```
class Solution {
public:
    void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {
        int i = 0, j = 0;

		/**
		* 兼容 [0]
		*      0
		*      [1]
	   	*      1
		* 这种输入
		*/
        if (m == 0) {
            for (; j < n; j++) {
                nums1[j] = nums2[j];
            }
            return;
        }

        while (j < n) {
            if (nums1[i] <= nums2[j]) {
			    // 此时已经到达nums1的最后一个元素，只需要把nums2按顺序赋值即可
                if (i == m + j - 1) {
                    int tmp_index = m + n - 1;
                    while(tmp_index > i) {
                        nums1[tmp_index] = nums2[n-1];
                        n--;
                        tmp_index--;
                    }
                    break;
                }
                i++;
                continue;
            } else {
                int tmp_index = m + j;
                while (tmp_index > i) {
                    nums1[tmp_index] = nums1[tmp_index-1];
                    tmp_index--;
                }
                nums1[tmp_index] = nums2[j];
                j++;
                i++;
            }
        }
    }
};
```

Success

Details

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Merge Sorted Array.

Memory Usage: 8.7 MB, less than 100.00% of C++ online submissions for Merge Sorted Array.
