# balanced-binary-tree

[https://leetcode.com/problems/balanced-binary-tree/](https://leetcode.com/problems/balanced-binary-tree/)

```
Given a binary tree, determine if it is height-balanced.

For this problem, a height-balanced binary tree is defined as:

a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example 1:

Given the following tree [3,9,20,null,null,15,7]:

    3
   / \
  9  20
    /  \
   15   7
Return true.

Example 2:

Given the following tree [1,2,2,3,3,null,null,4,4]:

       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
Return false.
```

# thinking

完全二叉树，也就是根节点左右两个子树的层数不能相差大于1，并且每一个子树也要保证这个要求。

解决方案也是从根节点出发向两侧走起，使用递归就可以轻松解决，因为完全二叉树肯定是要完全满足条件，当发现条件不满足时立刻返回。所以使用了一个引用变量**isbalan**来维护这个状态，避免不必要的递归。

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
    int level(TreeNode* root) {
        if (!root) return 0;
        return 1 + max(level(root->left), level(root->right));
    }

    void helper(TreeNode* root, bool &isbalan) {
        if (!isbalan || !root)  return ;
        int left = level(root->left);
        int right = level(root->right);

        if (abs(left - right) > 1) {
            isbalan = false;
        }
        helper(root->left, isbalan);
        helper(root->right, isbalan);
    }

    bool isBalanced(TreeNode* root) {
        if (!root) return 1;

        bool balanced = true;
        helper(root, balanced);

        return balanced;
    }
};
```

Runtime: 20 ms, faster than 64.01% of C++ online submissions for Balanced Binary Tree.

Memory Usage: 17.3 MB, less than 62.89% of C++ online submissions for Balanced Binary Tree.
