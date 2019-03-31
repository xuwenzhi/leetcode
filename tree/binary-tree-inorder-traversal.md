# binary-tree-inorder-traversal

[https://leetcode.com/problems/binary-tree-inorder-traversal/](https://leetcode.com/problems/binary-tree-inorder-traversal/)

```
Given a binary tree, return the inorder traversal of its nodes' values.

Example:

Input: [1,null,2,3]
   1
    \
     2
    /
   3

Output: [1,3,2]
Follow up: Recursive solution is trivial, could you do it iteratively?
```

# thinking
做一个中序遍历，然后赋值就行了。哦，好像Description说的是最好让用iteration，都行都行。

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
    vector<int> inorderTraversal(TreeNode* root) {
        vector<int> vec{};
        if (!root) return vec;
        inOrder(root, vec);
        return vec;
    }

    void inOrder(TreeNode* root, vector<int> &vec) {
        if (root->left) inOrder(root->left, vec);
        vec.push_back(root->val);
        if (root->right) inOrder(root->right, vec);
    }
};
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Binary Tree Inorder Traversal.

Memory Usage: 9.4 MB, less than 27.15% of C++ online submissions for Binary Tree Inorder Traversal.

# solution (iteratively)

```
// Non-recursion
class Solution {
public:
    vector<int> inorderTraversal(TreeNode *root) {
        vector<int> res;
        stack<TreeNode*> s;
        TreeNode *p = root;
        while (p || !s.empty()) {
            while (p) {
                s.push(p);
                p = p->left;
            }
            p = s.top(); s.pop();
            res.push_back(p->val);
            p = p->right;
        }
        return res;
    }
};
```
