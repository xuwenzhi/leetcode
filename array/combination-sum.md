# combination-sum

[https://leetcode.com/problems/combination-sum/](https://leetcode.com/problems/combination-sum/)

```
Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

The same repeated number may be chosen from candidates unlimited number of times.

Note:

All numbers (including target) will be positive integers.
The solution set must not contain duplicate combinations.
Example 1:

Input: candidates = [2,3,6,7], target = 7,
A solution set is:
[
  [7],
  [2,2,3]
]
Example 2:

Input: candidates = [2,3,5], target = 8,
A solution set is:
[
  [2,2,2,2],
  [2,3,3],
  [3,5]
]
```

# solution (myself)

```c++
// O(n^3) Runtime, O(n^3) Space.
class Solution {
private:
    vector<int> pushBack(vector<int> pre, int value, int times = 1) {
        for (int i=1;i<=times;i++) {
            pre.push_back(value);
        }

        return pre;
    }
public:

    void combination(vector<int>& candidates, int current, int target, vector<int> pre, vector<vector<int>> &res) {

        if (current >= candidates.size()) return;

        if (target == candidates[current]) {
            pre.push_back(target);
            if (pre.size() > 0) res.push_back(pre);

            return;
        }

        if (target % candidates[current] == 0) {
            res.push_back(pushBack(pre, candidates[current], target / candidates[current]));
        }

        for (int i=target/candidates[current];i>=1;i--) {
            for (int j=current+1;j < candidates.size();j++) {
                if (target > candidates[current] * i) {
                    combination(candidates,
                            j,
                            target - candidates[current] * i,
                            pushBack(pre, candidates[current], i),
                            res);
                }
            }
        }
    }

    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {
        vector<vector<int>> res{};
        vector<int> pre{};

        for (int i=0;i<candidates.size();i++) {
            combination(candidates, i, target, pre, res);
        }

        return res;
    }
};
//Runtime: 60 ms, faster than 18.91% of C++ online submissions for Combination Sum.
//Memory Usage: 20.3 MB, less than 15.36% of C++ online submissions for Combination Sum.
```


# solution (concise edition)

```c++
class Solution {
public:
    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {
        vector<vector<int>> res;
        vector<int> out;
        combinationSumDFS(candidates, target, 0, out, res);
        return res;
    }
    void combinationSumDFS(vector<int>& candidates, int target, int start, vector<int>& out, vector<vector<int>>& res) {
        if (target < 0) return;
        if (target == 0) {res.push_back(out); return;}
        for (int i = start; i < candidates.size(); ++i) {
            out.push_back(candidates[i]);
            combinationSumDFS(candidates, target - candidates[i], i, out, res);
            out.pop_back();
        }
    }
};
//Runtime: 20 ms, faster than 59.01% of C++ online submissions for Combination Sum.
//Memory Usage: 9.5 MB, less than 99.81% of C++ online submissions for Combination Sum.
```

# refer

[[LeetCode] Combination Sum 组合之和](http://www.cnblogs.com/grandyang/p/4419259.html)
