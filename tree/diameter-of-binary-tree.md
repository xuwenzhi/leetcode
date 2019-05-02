# diameter-of-binary-tree

[https://leetcode.com/problems/diameter-of-binary-tree/](https://leetcode.com/problems/diameter-of-binary-tree/)

```
Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

Example:
Given a binary tree

          1
         / \
        2   3
       / \
      4   5
Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].

Note: The length of path between two nodes is represented by the number of edges between them.
```

# solution

这道题实际上就是计算，一个节点左右两边的深度之和的最大值。这里用递归实现，用一个变量保存最大结果值，递归函数每次返回max(left, right)。

```c++
// O(n) Runtime, O(logn) Space.
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
    int diameterOfBinaryTree(TreeNode* root) {
        int maxDiameter = 0;
        diameter(root, maxDiameter);

        return maxDiameter;
    }

    int diameter(TreeNode* root, int &maxDiameter) {
        if (!root) return 0;

        if (!root->left && !root->right) return 1;

        int left=0, right=0;
        left  = diameter(root->left, maxDiameter);
        right = diameter(root->right, maxDiameter);

        maxDiameter = max(maxDiameter, left + right);

        return 1 + max(left, right);
    }
};
//Runtime: 16 ms, faster than 99.07% of C++ online submissions for Diameter of Binary Tree.
//Memory Usage: 19.8 MB, less than 100.00% of C++ online submissions for Diameter of Binary Tree.
```
