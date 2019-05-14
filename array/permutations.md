# permutations

[https://leetcode.com/problems/permutations/](https://leetcode.com/problems/permutations/)

```
Given a collection of distinct integers, return all possible permutations.

Example:

Input: [1,2,3]
Output:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
```

# solution (hashtable)

我的方案是，每次选一个数字和其余的数字匹配，然后其余的数字再选一个数字和其余的匹配，这样也就构造了一个递归。不过有一个问题是在组合过程中无法判断当前处理的数据是否已经处理完了，那么就又使用了个hashtable来存储之前已经存储的数字。

```c++
class Solution {
public:
    vector<vector<int>> permute(vector<int>& nums) {
        vector<vector<int>> res{};

        for (int i=0;i<nums.size();i++) {
            vector<int> pre{};
            unordered_map<int,int> m;
            permute(nums, i, pre, res, m);
        }

        return res;
    }

    void permute(vector<int> &nums, int current, vector<int> pre, vector<vector<int>> &res, unordered_map<int,int> m) {
        if (current >= nums.size()) return;

        pre.push_back(nums[current]);
        m[current] = 1;
        if (pre.size() == nums.size()) {
            res.push_back(pre);
            return; // all number is settled.
        }

        for (int i=0;i<nums.size();i++) {
			// when i is current and i in the hashtable continue.
            if (i == current || m[i]) continue;
            permute(nums,i, pre, res, m);
        }
    }
};
//Runtime: 16 ms, faster than 46.61% of C++ online submissions for Permutations.
//Memory Usage: 12.5 MB, less than 5.18% of C++ online submissions for Permutations.
```

# solution (insert position)

一种插入的思路

n = 1   [1]
n = 2   [2, 1],[1, 2]
n = 3   [3,2,1],[2,3,1][2,1,3],[3,1,2],[1,3,2],[1,2,3]

...以此类推

```c++
class Solution {
public:
    vector<vector<int>> permute(vector<int>& nums) {
        vector<vector<int>> res{};
        for (int i=0;i<nums.size();i++) {
            if (res.empty()) {
                res.push_back({nums[i]}); // res = [[1]]
            } else {
                vector<vector<int>> newres{};
                for (int j=0;j<res.size();j++) {
                    int pos = 0;
                    while (pos < res[j].size()) {
                        vector<int> tmp = {};
                        for (int k=0;k<=res[j].size();k++) {
                            if (k == pos) {
                                tmp.push_back(nums[i]);
                            }
                            if (k < res[j].size()) {
                                tmp.push_back(res[j][k]);
                            }
                        }
                        newres.push_back(tmp);
                        pos++;
                    }
                    res[j].push_back(nums[i]); //add 2 to [1] for [1, 2]
                    newres.push_back(res[j]);
                }

                res = newres;
            }
        }

        return res;
    }
};
//Runtime: 12 ms, faster than 98.08% of C++ online submissions for Permutations.
//Memory Usage: 10.2 MB, less than 21.44% of C++ online submissions for Permutations.
```

# solution (select swap)

这种解法就比较有意思了，有点类似于选择排序的位置，不过这个思路是，让nums的所有数字都和begin位置swap一下，然后依次得到结果


[1,2,3]

循环1 : [1,2,3]

由于begin最初为0，第一个切换点就是1，此时1的位置固定不动,然后进入递归，得到结果 [1,2,3][1,3,2]

循环2 : [1,2,3]，此时将1和2进行swap，nums为[2,1,3]，2的位置固定不动，进入递归，得到结果 [2,1,3][2,3,1]

... 以此类推

```c++
class Solution {
public:
    vector<vector<int>> permute(vector<int>& nums) {
        vector<vector<int>> res;

        permute(nums, 0, res);

        return res;
    }

    void permute(vector<int>& nums, int begin, vector<vector<int>>& res) {
        if (begin >= nums.size()) {
            res.push_back(nums);
            return;
        }

        for (int i=begin;i<nums.size();i++) {
            swap(nums[i], nums[begin]);
            permute(nums, begin+1, res);
            swap(nums[i], nums[begin]);
        }
    }
};
//Runtime: 12 ms, faster than 98.08% of C++ online submissions for Permutations.
//Memory Usage: 9.4 MB, less than 74.49% of C++ online submissions for Permutations.
```

# solution (stl next_permutation)

这里使用是STL内置的[next_permutation()](http://www.cplusplus.com/reference/algorithm/next_permutation/?kw=next_permutation)用于生成全排列的函数，不过需要先对数组进行排序，所以至于这个办法的效果好不好，关键要看具体case.

```c++
class Solution {
public:
    vector<vector<int>> permute(vector<int>& nums) {
        vector<vector<int>> res{};

        sort (nums.begin(),nums.end());
        do {
            res.push_back(nums);
        }while(next_permutation(nums.begin(),nums.end()));

        return res;
    }
};
//Runtime: 8 ms, faster than 99.95% of C++ online submissions for Permutations.
//Memory Usage: 9.3 MB, less than 76.90% of C++ online submissions for Permutations.
```
