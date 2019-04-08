# median-of-two-sorted-arrays

[https://leetcode.com/problems/median-of-two-sorted-arrays/](https://leetcode.com/problems/median-of-two-sorted-arrays/)

```
There are two sorted arrays nums1 and nums2 of size m and n respectively.

Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

You may assume nums1 and nums2 cannot be both empty.

Example 1:

nums1 = [1, 3]
nums2 = [2]

The median is 2.0
Example 2:

nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5
```

# thinking

两个数组是已经排好序的，题目也要求时间复杂度是O(log(m+n))，这让人联想到可以通过二分查找解决。

我的方案是这样的，只需要遍历一半 **(m+n)/2**。不考虑m+n到底是偶数还是奇数，创建一个数组用于保存**(m+n)/2 + 1**就完事了。

Notice:不过越想我这方案有点暴力，而且貌似也没有满足题目要求.
更多参考[Share my O(log(min(m,n)) solution with explanation](https://leetcode.com/problems/median-of-two-sorted-arrays/discuss/2481/)

# solution

```c++
class Solution {
public:
    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
        int nums1Len = nums1.size(), nums2Len = nums2.size();
        int totalLen = nums1Len + nums2Len;
        int medianIndex = totalLen / 2;
        vector<int> nums{};
        int i=0, j=0, k = 0, median = totalLen / 2 + 1;
        while (k < median && (i < nums1Len || j < nums2Len)) {
            if (i < nums1Len && j < nums2Len) {
                if (nums1[i] <= nums2[j]) {
                    nums.push_back(nums1[i]);
                    i++;
                } else {
                    nums.push_back(nums2[j]);
                    j++;
                }
            } else if (i >= nums1Len) {
                nums.push_back(nums2[j]);
                j++;
            } else if (j >= nums2Len) {
                nums.push_back(nums1[i]);
                i++;
            }
            k++;
        }

        if (totalLen % 2 == 1)
            return (double)nums[k-1];
        return (double)(nums[k-1] + nums[k-2]) / 2;
    }
};
```

Runtime: 28 ms, faster than 87.67% of C++ online submissions for Median of Two Sorted Arrays.

Memory Usage: 10 MB, less than 99.14% of C++ online submissions for Median of Two Sorted Arrays.
