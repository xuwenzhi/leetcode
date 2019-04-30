# invert-binary-tree

[https://leetcode.com/problems/invert-binary-tree/](https://leetcode.com/problems/invert-binary-tree/)

```
Invert a binary tree.

Example:

Input:

     4
   /   \
  2     7
 / \   / \
1   3 6   9
Output:

     4
   /   \
  7     2
 / \   / \
9   6 3   1
Trivia:
This problem was inspired by this original tweet by Max Howell:

Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so f*** off.
```

# solution

```c++
// O(n) Runtime, O(n) Space.
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
    TreeNode* invertTree(TreeNode* root) {
        if (!root) return nullptr;

        TreeNode* node = new TreeNode(root->val);

        invertTree(root, node);

        return node;
    }

    void invertTree(TreeNode* root, TreeNode* &node) {
        if (!root) return;

        if (root->left) {
            node->right = new TreeNode(root->left->val);
        }
        if (root->right) {
            node->left  = new TreeNode(root->right->val);
        }

        invertTree(root->left, node->right);
        invertTree(root->right, node->left);
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Invert Binary Tree.
//Memory Usage: 9.8 MB, less than 5.52% of C++ online submissions for Invert Binary Tree.
```
