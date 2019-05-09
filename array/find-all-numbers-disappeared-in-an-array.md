# find-all-numbers-disappeared-in-an-array

[https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/](https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/)


```
Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

Find all the elements of [1, n] inclusive that do not appear in this array.

Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.

Example:

Input:
[4,3,2,7,8,2,3,1]

Output:
[5,6]
```

# solution (recover normal array)

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    vector<int> findDisappearedNumbers(vector<int>& nums) {
        int l = nums.size();
        vector<int> base(l+1, 0);

        for (int i=0;i<l;i++) {
            base[nums[i]] = 1;
        }

        vector<int> res{};
        for (int i=1;i<l+1;i++) {
            if (base[i] == 0) res.push_back(i);
        }

        return res;
    }
};
//Runtime: 128 ms, faster than 31.84% of C++ online submissions for Find All Numbers Disappeared in an Array.
//Memory Usage: 16.2 MB, less than 13.85% of C++ online submissions for Find All Numbers Disappeared in an Array.
```


# solution (相反数)

核心代码 **nums[abs(nums[i]) - 1] = 0 - nums[abs(nums[i]) - 1];**

```c++
class Solution {
public:
    vector<int> findDisappearedNumbers(vector<int>& nums) {
        int l = nums.size();

        for (int i=0;i<l;i++) {
            int index = abs(nums[i])-1;
            if (nums[index] > 0) {
                nums[index] = 0-nums[index];
            }
        }

        vector<int> res{};
        for (int i=0;i<l;i++) {
            if (nums[i] > 0) {
                res.push_back(i+1);
            }
        }

        return res;
    }
};
//Runtime: 112 ms, faster than 97.04% of C++ online submissions for Find All Numbers Disappeared in an Array.
//Memory Usage: 15 MB, less than 92.82% of C++ online submissions for Find All Numbers Disappeared in an Array.
```


# solution (swap)

swap方法是将数字移动到指定的位置上去，比如序列**[4,3,2,7,8,2,3,1]**

   0 1 2 3 4 5 6 7

  [4,3,2,7,8,2,3,1]

  [7,3,2,4,8,2,3,1]

  [3,3,2,4,8,2,7,1]

  ...
  以此类推.

由于swap的次数其实不确定，所以Runtime会相对大一些.

```c++
// O(n) Runtime, O(1) Space.
class Solution {
public:
    vector<int> findDisappearedNumbers(vector<int>& nums) {
        int l = nums.size();

        for (int i=0;i<l;i++) {
            if (nums[i] != nums[nums[i] - 1]) {
                swap(nums[i], nums[nums[i]-1]);
                i--;
            }
        }

        vector<int> res{};
        for (int i=0;i<l;i++) {
            if (nums[i] != i+1) {
                res.push_back(i+1);
            }
        }

        return res;
    }
};
//Runtime: 128 ms, faster than 31.84% of C++ online submissions for Find All Numbers Disappeared in an Array.
//Memory Usage: 14.9 MB, less than 99.49% of C++ online submissions for Find All Numbers Disappeared in an Array.
```
