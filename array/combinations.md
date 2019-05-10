# combinations

[https://leetcode.com/problems/combinations/](https://leetcode.com/problems/combinations/)

```
Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

Example:

Input: n = 4, k = 2
Output:
[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]
```

# solution (recuration)

```c++
// O(n^2) Runtime, O(n^2) Space.
class Solution {
public:
    vector<vector<int>> combine(int n, int k) {
        vector<vector<int>> res;
        vector<int> pre;

        combine(n, 1, k, pre, res);

        return res;
    }

    void combine(int n, int start, int k, vector<int> pre, vector<vector<int>> &res) {
        if (pre.size() >= k) {
            res.push_back(pre);
            return;
        }

        for (int i=start;i<=n;i++) {
            pre.push_back(i);
            combine(n, i+1, k, pre, res);
            pre.pop_back();
        }
    }
};
//Runtime: 464 ms, faster than 16.12% of C++ online submissions for Combinations.
//Memory Usage: 167.1 MB, less than 6.44% of C++ online submissions for Combinations.
```


# solution (C(n, k) = n * C(n-1, k-1) + C(n-1, k))

这种方案用到了组合数学中的**C(n, k) = n * C(n-1, k-1) + C(n-1, k)**，也就是比如 n = 4 k = 2的情况

[[3,4],[2,4],[1,4],[2,3],[1,3],[1,2]] = 4 * ([1],[2],[3]) + [[1,2],[2,3],[1,3]]

以此类推，得到结果~

```c++
class Solution {
public:
    vector<vector<int>> combine(int n, int k) {
        if (k > n || k < 0) return {};
        if (k == 0) return {{}};

        vector<vector<int>> res = combine(n-1, k-1);
        for (auto &a : res) a.push_back(n);

        for (auto a : combine(n-1, k)) res.push_back(a);

        return res;
    }
};
//Runtime: 100 ms, faster than 45.13% of C++ online submissions for Combinations.
//Memory Usage: 38.9 MB, less than 17.04% of C++ online submissions for Combinations.
```

# solution (iterative)

```c++
class Solution {
public:
	vector<vector<int>> combine(int n, int k) {
		vector<vector<int>> result;
		int i = 0;
		vector<int> p(k, 0);
		while (i >= 0) {
			p[i]++;
			if (p[i] > n) --i;
			else if (i == k - 1) result.push_back(p);
			else {
			    ++i;
			    p[i] = p[i - 1];
			}
		}
		return result;
	}
};
```



# refer

[[LeetCode] Combinations 组合项](https://www.cnblogs.com/grandyang/p/4332522.html)

[Short Iterative C++ Answer 8ms](https://leetcode.com/problems/combinations/discuss/26992/Short-Iterative-C%2B%2B-Answer-8ms)
