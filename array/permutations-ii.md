# permutations-ii

[https://leetcode.com/problems/permutations-ii](https://leetcode.com/problems/permutations-ii)

```
Given a collection of numbers that might contain duplicates, return all possible unique permutations.

Example:

Input: [1,1,2]
Output:
[
  [1,1,2],
  [1,2,1],
  [2,1,1]
]
```

# solution (stl next_permutations)

```c++
class Solution {
public:
    vector<vector<int>> permuteUnique(vector<int>& nums) {
        vector<vector<int>> res{};

        sort (nums.begin(),nums.end());
        do {
            res.push_back(nums);
        }while(next_permutation(nums.begin(),nums.end()));

        return res;
    }
};
//Runtime: 20 ms, faster than 99.76% of C++ online submissions for Permutations II.
//Memory Usage: 10 MB, less than 83.63% of C++ online submissions for Permutations II.
```


# solution (swap)

由[[Medium]permutations - 全排列](https://github.com/xuwenzhi/leetcode/blob/master/array/permutations.md)中的swap solution改编而来，因为这个问题是可能出现重复的数字，那么解决方案就是使用hashtable用于存储该数字是否已经处理过了，例如 [1,2,2,3,3]当进行第一个2处理时，将2写入hashtable，第二个2过来判断的时候判断之前已经处理过2，那么就不会处理了.

```c++
class Solution {
public:
    vector<vector<int>> permuteUnique(vector<int>& nums) {
        vector<vector<int>> res{};
        permute(nums, 0, res);

        return res;
    }

    void permute(vector<int>& nums, int begin, vector<vector<int>>& res) {
        if (begin >= nums.size()) {
            res.push_back(nums);
            return;
        }

        unordered_map<int,bool> m;
        for (int i=begin;i<nums.size();i++) {
            if (m[nums[i]]) continue;
            swap(nums[i], nums[begin]);
            permute(nums, begin+1, res);
            swap(nums[i], nums[begin]);
            m[nums[i]] = true;
        }
    }
};
//Runtime: 24 ms, faster than 93.20% of C++ online submissions for Permutations II.
//Memory Usage: 11.2 MB, less than 23.10% of C++ online submissions for Permutations II.
```
