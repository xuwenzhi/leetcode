# binary-tree-level-order-traversal

[https://leetcode.com/problems/binary-tree-level-order-traversal/](https://leetcode.com/problems/binary-tree-level-order-traversal/)

```
Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

For example:
Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
return its level order traversal as:

[
  [3],
  [9,20],
  [15,7]
]
```

# thinking

一个BFS 就可以解决问题了，类似问题。

# solution

```
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
    vector<vector<int>> levelOrder(TreeNode* root) {
        vector<vector<int>> vec{};
        if (!root) return vec;
        int index = 0, qLen = 0;
        TreeNode* tmp;
        vector<int> col;
        queue<TreeNode*> q{{root}};
        while (!q.empty()) {
            col.clear();
            qLen = q.size();
            for (int i = 0; i < qLen; i++) {
                tmp = q.front();
                q.pop();
                col.push_back(tmp->val);
                if (tmp->left)  q.push(tmp->left);
                if (tmp->right) q.push(tmp->right);
            }
            vec.push_back(col);
            index++;
        }

        return vec;
    }
};
```

Runtime: 8 ms, faster than 100.00% of C++ online submissions for Binary Tree Level Order Traversal.

Memory Usage: 13.7 MB, less than 93.38% of C++ online submissions for Binary Tree Level Order Traversal.
