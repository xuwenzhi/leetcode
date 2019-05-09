# combination-sum-ii

[https://leetcode.com/problems/combination-sum-ii/](https://leetcode.com/problems/combination-sum-ii/)

```
Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

Each number in candidates may only be used once in the combination.

Note:

All numbers (including target) will be positive integers.
The solution set must not contain duplicate combinations.
Example 1:

Input: candidates = [10,1,2,7,6,1,5], target = 8,
A solution set is:
[
  [1, 7],
  [1, 2, 5],
  [2, 6],
  [1, 1, 6]
]
Example 2:

Input: candidates = [2,5,2,1,2], target = 5,
A solution set is:
[
  [1,2,2],
  [5]
]
```

# solution

由于每个位置的数字只能用一次，也没想到什么好的办法，所以就用了个hash存储序列顺序，所以性能差一些。

例如
[1,8,8,4,4,4,4]
16

如果不判断hash会生成

[[8,8],[8,4,4],[8,4,4],[8,4,4],[8,4,4],[8,4,4],[8,4,4],[8,4,4],[8,4,4],[8,4,4],[8,4,4],[8,4,4],[8,4,4],[4,4,4,4]]

使用了个**join**函数用来生成Hash Key。

```c++
class Solution {
private:
    unordered_map<string,int> m;
public:
    string join(vector<int> pre) {
        string s = "";
        for (int i : pre) {
            s += string(1, i+'a');
        }

        return s;
    }

    void combination(vector<int>& candidates, int target, int start, vector<int> pre, vector<vector<int>>& res) {
        if (target < 0) return;
        if (target == 0) {
            sort(pre.begin(), pre.end());
            string s = join(pre);
            if (!m.count(s))
                res.push_back(pre);
            m[s] = 1;
            return;
        }

        for (int i=start+1;i<candidates.size();i++) {
            pre.push_back(candidates[i]);
            combination(candidates, target-candidates[i], i, pre, res);
            pre.pop_back();
        }
    }

    vector<vector<int>> combinationSum2(vector<int>& candidates, int target) {
        vector<vector<int>> res;

        vector<int> candidate {};
        for (int i=0;i<candidates.size();i++) {
            if (candidates[i] <= target) candidate.push_back(candidates[i]);
        }

        for (int i=0;i<candidate.size();i++) {
            vector<int> pre;
            pre.push_back(candidate[i]);
            combination(candidate, target-candidate[i], i, pre, res);
        }

        return res;
    }
};

//Runtime: 100 ms, faster than 7.91% of C++ online submissions for Combination Sum II.
//Memory Usage: 29.3 MB, less than 12.20% of C++ online submissions for Combination Sum II.
```


# solution (presort)

这个题的问题主要是这个数字重复，进而导致结果重复，所以这个解决方案是首先对数组进行排序，然后再进行判断的时候加一个判断**if (i > start && candidates[i] == candidates[i-1]) continue;**，也就是遇到重复的直接绕过去.

```c++
class Solution {
public:
    void combination(vector<int>& candidates, int target, int start, vector<int> pre, vector<vector<int>>& res) {
        if (target < 0) return;
        if (target == 0) {
            res.push_back(pre);
            return;
        }

        for (int i=start;i<candidates.size();i++) {
            if (i > start && candidates[i] == candidates[i-1]) continue;

            pre.push_back(candidates[i]);
            combination(candidates, target-candidates[i], i+1, pre, res);
            pre.pop_back();
        }
    }

    vector<vector<int>> combinationSum2(vector<int>& candidates, int target) {
        vector<vector<int>> res;

        vector<int> candidate {};
        for (int i=0;i<candidates.size();i++) {
            if (candidates[i] <= target) candidate.push_back(candidates[i]);
        }

        sort(candidate.begin(), candidate.end());

        vector<int> pre;
        combination(candidate, target, 0, pre, res);

        return res;
    }
};
//Runtime: 20 ms, faster than 34.67% of C++ online submissions for Combination Sum II.
//Memory Usage: 13 MB, less than 29.49% of C++ online submissions for Combination Sum II.
```
