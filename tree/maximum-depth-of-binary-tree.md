# maximum-depth-of-binary-tree

[https://leetcode.com/problems/maximum-depth-of-binary-tree/](https://leetcode.com/problems/maximum-depth-of-binary-tree/)

```
Given a binary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Note: A leaf is a node with no children.

Example:

Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
return its depth = 3.
```

# thinking

使用一个队列来进行中序遍历，一排一排遍历树，然后计算深度即可.
下面还有一个递归实现.

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
    int maxDepth(TreeNode* root) {
        if (!root) return 0;
        int depth = 0;
        queue<TreeNode*> q;
        q.push(root);
        while (!q.empty()) {
            ++depth;
            for (int i = q.size(); i > 0; --i) {
                TreeNode *t = q.front(); q.pop();
                if (t->left) q.push(t->left);
                if (t->right) q.push(t->right);
            }
        }
        return depth;
    }
};
```

Runtime: 16 ms, faster than 99.08% of C++ online submissions for Maximum Depth of Binary Tree.

Memory Usage: 19.4 MB, less than 68.11% of C++ online submissions for Maximum Depth of Binary Tree.


# solution(recursive)

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
    int maxDepth(TreeNode* root) {
        if (!root) return 0;
        return 1 + max(maxDepth(root->left), maxDepth(root->right));
    }
};
```
