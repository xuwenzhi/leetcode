# increasing-order-search-tree

[https://leetcode.com/problems/increasing-order-search-tree/](https://leetcode.com/problems/increasing-order-search-tree/)

```
Given a tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only 1 right child.

Example 1:
Input: [5,3,6,2,4,null,8,1,null,null,null,7,9]

       5
      / \
    3    6
   / \    \
  2   4    8
 /        / \
1        7   9

Output: [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]

 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
            \
             7
              \
               8
                \
                 9
Note:

The number of nodes in the given tree will be between 1 and 100.
Each node will have a unique integer value from 0 to 1000.
```

# thinking

中序重新rearrange树的话，也就是来一个中序遍历，然后重新创建各个节点就完事了.


# solution

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
    TreeNode* increasingBST(TreeNode* root) {
        TreeNode* dummy = new TreeNode(-1);
        dummy->left = nullptr;
        dummy->right = nullptr;
        TreeNode* pre = dummy;
        inorder(root, pre);
        return dummy->right;
    }

    void inorder(TreeNode* root, TreeNode* &pre) {
        if (!root) return;
        inorder(root->left, pre);
        TreeNode* node = new TreeNode(root->val);
        node->left = nullptr;
        node->right = nullptr;
        pre->right = node;
        pre = pre->right;
        inorder(root->right, pre);
    }
};
```

Runtime: 52 ms, faster than 88.52% of C++ online submissions for Increasing Order Search Tree.

Memory Usage: 25.2 MB, less than 100.00% of C++ online submissions for Increasing Order Search Tree.
