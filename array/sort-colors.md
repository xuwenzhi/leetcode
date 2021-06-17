# sort-colors

[https://leetcode.com/problems/sort-colors/](https://leetcode.com/problems/sort-colors/)

```
Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.

Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

Note: You are not suppose to use the library's sort function for this problem.

Example:

Input: [2,0,2,1,1,0]
Output: [0,0,1,1,2,2]
Follow up:

A rather straight forward solution is a two-pass algorithm using counting sort.
First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
Could you come up with a one-pass algorithm using only constant space?
```

# solution (counter) 

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    void sortColors(vector<int>& nums) {
        int counter[3] = {0};
        for (auto i:nums) {
            counter[i]++;
        }
        int j = 0;
        for (int i=0;i<3;i++) {
            while (counter[i]-- > 0) {
                nums[j++] = i;
            }
        }
    }
};
//Runtime: 4 ms, faster than 73.97% of C++ online submissions for Sort Colors.
//Memory Usage: 8.6 MB, less than 67.31% of C++ online submissions for Sort Colors.
```

# solution (3 Way Quick Sort)

![https://github.com/xuwenzhi/leetcode/raw/master/images/sort_colors1.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/sort_colors1.jpg)

![https://github.com/xuwenzhi/leetcode/raw/master/images/sort_colors1.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/sort_colors2.jpg)

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    void sortColors(vector<int>& nums) {
        int zero = -1;
        int two  = nums.size();
        for (int i=0;i<two;) {
            if (nums[i] == 2) {
                two--;
                swap(nums[i], nums[two]);
            } else if(nums[i] == 1) {
                i++;
            } else {
                swap(nums[++zero], nums[i++]);
            }
        }
    }
};
//Runtime: 4 ms, faster than 73.97% of C++ online submissions for Sort Colors.
//Memory Usage: 8.5 MB, less than 77.33% of C++ online submissions for Sort Colors.
```

```c++
// O(n) Runtime, O(1) Space
class Solution {
public:
    void sortColors(vector<int>& nums) {
        int l = 0, r = nums.size() - 1;
        int i = 0;
        // 这里一定是小于等于，比如 [2, 0, 1] case，最后 i = 1, r = 1，此时数组为 [1, 0, 2]，
        while (i <= r) {
            if (nums[i] == 0) {
                swap(nums[l], nums[i]);
                l++;
                i++;
            } else if(nums[i] == 2) {
                swap(nums[r], nums[i]);
                r--;
            } else {
                i++;
            }
        }
    }
};
//Runtime: 4 ms, faster than 48.66% of C++ online submissions for Sort Colors.
//Memory Usage: 8.2 MB, less than 66.27% of C++ online submissions for Sort Colors.
```