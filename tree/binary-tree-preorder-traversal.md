# binary-tree-preorder-traversal

[https://leetcode.com/problems/binary-tree-preorder-traversal/](https://leetcode.com/problems/binary-tree-preorder-traversal/)

```
Given a binary tree, return the preorder traversal of its nodes' values.

Example:

Input: [1,null,2,3]
   1
    \
     2
    /
   3

Output: [1,2,3]
Follow up: Recursive solution is trivial, could you do it iteratively?
```

# thinking

这个就不说了，和[[medium]binary-tree-inorder-traversal](https://github.com/xuwenzhi/leetcode/blob/master/tree/binary-tree-inorder-traversal.md)一个味

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
    vector<int> preorderTraversal(TreeNode* root) {
        vector<int> vec{};
        if (!root) return vec;
        preOrder(root, vec);
        return vec;
    }

    void preOrder(TreeNode* root, vector<int> &vec) {
        vec.push_back(root->val);
        if (root->left) preOrder(root->left, vec);
        if (root->right) preOrder(root->right, vec);
    }
};
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Binary Tree Preorder Traversal.

Memory Usage: 9.3 MB, less than 46.24% of C++ online submissions for Binary Tree Preorder Traversal.


# solution (iteratively)

```
class Solution {
public:
    vector<int> preorderTraversal(TreeNode* root) {
        if (!root) return {};
        vector<int> res;
        stack<TreeNode*> s{{root}};
        while (!s.empty()) {
            TreeNode *t = s.top(); s.pop();
            res.push_back(t->val);
            if (t->right) s.push(t->right);
            if (t->left) s.push(t->left);
        }
        return res;
    }
};
```

```c++
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    TreeNode* preorder(TreeNode* root, vector<int>& result) {
        if (!root) return nullptr;
        
        result.push_back(root->val);
        TreeNode* left = preorder(root->left, result);
        if (left != nullptr) return left;
        return preorder(root->right, result);
    }
        
    vector<int> preorderTraversal(TreeNode* root) {
        vector<int> result;
        preorder(root, result);
        
        return result;
    }
};
```
