# merge-two-binary-trees

[https://leetcode.com/problems/merge-two-binary-trees/](https://leetcode.com/problems/merge-two-binary-trees/)

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
    TreeNode* mergeTrees(TreeNode* t1, TreeNode* t2) {
        if (!t1 && !t2) return nullptr;
        if (!t1 || !t2) return t1 ? t1 : t2;

        TreeNode* root = new TreeNode(t1->val + t2->val);
        merge(root->left, t1->left, t2->left);
        merge(root->right, t1->right, t2->right);

        return root;
    }

    void merge(TreeNode* &root, TreeNode *t1, TreeNode* t2) {
        if (!t1 && !t2) return;

        if (!t1 || !t2) {
            root = t1 ? t1 : t2;
            return;
        }

        root = new TreeNode(t1->val + t2->val);
        merge(root->left, t1->left, t2->left);
        merge(root->right, t1->right, t2->right);
    }
};
//Runtime: 44 ms, faster than 74.46% of C++ online submissions for Merge Two Binary Trees.
//Memory Usage: 19 MB, less than 38.58% of C++ online submissions for Merge Two Binary Trees.
```
