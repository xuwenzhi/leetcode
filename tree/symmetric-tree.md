# symmetric-tree

[https://leetcode.com/problems/symmetric-tree/](https://leetcode.com/problems/symmetric-tree/)

```
Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

    1
   / \
  2   2
 / \ / \
3  4 4  3
But the following [1,2,2,null,3,null,3] is not:

    1
   / \
  2   2
   \   \
   3    3
Note:
Bonus points if you could solve it both recursively and iteratively.
```
# thinking

这个题和[[easy]same-tree - 是否相同的树](https://github.com/xuwenzhi/leetcode/blob/master/tree/same-tree.md)就一个套路了，直接使用递归轻松解决。

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
    bool isSymmetric(TreeNode* root) {
        if (!root) return true;
        
        return isSame(root->left, root->right);
    }
    
    int isSame(TreeNode* left, TreeNode* right) {
        if (left == nullptr && right == nullptr) return 1;
        if (left == nullptr ^ right == nullptr) return 0;
        if (left->val != right->val) return 0;
        
        int result = 1;
        result *= isSame(left->right, right->left);
        result *= isSame(left->left, right->right);
        
        return result;
    }
};
```

Runtime: 8 ms, faster than 100.00% of C++ online submissions for Symmetric Tree.

Memory Usage: 14.9 MB, less than 99.64% of C++ online submissions for Symmetric Tree.

