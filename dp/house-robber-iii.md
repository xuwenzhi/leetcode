# house-robber-iii

[https://leetcode.com/problems/house-robber-iii/](https://leetcode.com/problems/house-robber-iii/)

```
The thief has found himself a new place for his thievery again. There is only one entrance to this area, called the "root." Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that "all houses in this place forms a binary tree". It will automatically contact the police if two directly-linked houses were broken into on the same night.

Determine the maximum amount of money the thief can rob tonight without alerting the police.

Example 1:

Input: [3,2,3,null,3,null,1]

     3
    / \
   2   3
    \   \
     3   1

Output: 7
Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
Example 2:

Input: [3,4,5,1,3,null,1]

     3
    / \
   4   5
  / \   \
 1   3   1

Output: 9
Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9.
```

# solution

reference:
[Step by step tackling of the problem](https://leetcode.com/problems/house-robber-iii/discuss/79330/)

[[LeetCode] House Robber III 打家劫舍之三](https://www.cnblogs.com/grandyang/p/5275096.html)

```c++
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    int rob(TreeNode* root) {
        unordered_map<TreeNode*, int> m;
        return dfs(root, m);
    }
    int dfs(TreeNode *root, unordered_map<TreeNode*, int> &m) {
        if (!root) return 0;
        if (m.count(root)) return m[root];
        int val = 0;
        if (root->left) {
            val += dfs(root->left->left, m) + dfs(root->left->right, m);
        }
        if (root->right) {
            val += dfs(root->right->left, m) + dfs(root->right->right, m);
        }
        val = max(val + root->val, dfs(root->left, m) + dfs(root->right, m));
        m[root] = val;
        return val;
    }
};
//Runtime: 24 ms, faster than 76.91% of C++ online submissions for House Robber III.
//Memory Usage: 23.4 MB, less than 27.95% of C++ online submissions for House Robber III.
```


# solution (recursion without any other space.)

> Basically you want to compare which one is bigger between 1) you + sum of your grandchildren and 2) sum of your children.
reference: [Simple C++ solution](https://leetcode.com/problems/house-robber-iii/discuss/79333/)

```c++
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    int tryRob(TreeNode* root, int& l, int& r) {
        if (!root)
            return 0;

        int ll = 0, lr = 0, rl = 0, rr = 0;
        l = tryRob(root->left, ll, lr);
        r = tryRob(root->right, rl, rr);

        return max(root->val + ll + lr + rl + rr, l + r);
    }

    int rob(TreeNode* root) {
        int l, r;
        return tryRob(root, l, r);
    }
};
//Runtime: 28 ms, faster than 62.09% of C++ online submissions for House Robber III.
//Memory Usage: 20.4 MB, less than 100.00% of C++ online submissions for House Robber III.
```
