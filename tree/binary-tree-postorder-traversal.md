# binary-tree-postorder-traversal

[https://leetcode.com/problems/binary-tree-postorder-traversal/](https://leetcode.com/problems/binary-tree-postorder-traversal/)

```
Given a binary tree, return the postorder traversal of its nodes' values.

Example:

Input: [1,null,2,3]
   1
    \
     2
    /
   3

Output: [3,2,1]
Follow up: Recursive solution is trivial, could you do it iteratively?
```

# thinking

就是后序遍历二叉树，和[[easy]n-ary-tree-postorder-traversal](https://github.com/xuwenzhi/leetcode/blob/master/tree/n-ary-tree-postorder-traversal.md)一回事。

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
    vector<int> postorderTraversal(TreeNode* root) {
        vector<int> vec{};
        if (!root) return vec;

        helper(root, vec);
        return vec;
    }

    void helper(TreeNode* root, vector<int> &vec) {
        if (!root) return;
        helper(root->left, vec);
        helper(root->right, vec);
        vec.push_back(root->val);
    }
};
```

Runtime: 8 ms, faster than 19.91% of C++ online submissions for Binary Tree Postorder Traversal.

Memory Usage: 9.4 MB, less than 23.80% of C++ online submissions for Binary Tree Postorder Traversal.
