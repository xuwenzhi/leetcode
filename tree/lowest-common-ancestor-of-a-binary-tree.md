# lowest-common-ancestor-of-a-binary-tree

[https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/)

```
Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

Given the following binary tree:  root = [3,5,1,6,2,0,8,null,null,7,4]

```
![https://assets.leetcode.com/uploads/2018/12/14/binarytree.png](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)
```
Example 1:

Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
Output: 3
Explanation: The LCA of nodes 5 and 1 is 3.
Example 2:

Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
Output: 5
Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.


Note:

All of the nodes' values will be unique.
p and q are different and both values will exist in the binary tree.
```

# thinking

也就是[[Easy]lowest-common-ancestor-of-a-binary-search-tree](https://github.com/xuwenzhi/leetcode/blob/master/tree/lowest-common-ancestor-of-a-binary-search-tree.md)的升级版本，唯一的差别就是不是二叉搜索树了，还真是想了好久，本来还想通过解决上一个问题那么解决，结果出现内存溢出，所以还真是有点摸不着头脑，所以就看讲解了。

解法就是采用分治的思想，把这个问题考虑为一个简单的问题，比如一共就三个节点，考虑几种情况，比如

1. **p**和**q**在同一子树上

2. **p**和**q**分散在左右子树上

等等。

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
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        if (!root || root == p || root == q) return root;

        TreeNode* left = lowestCommonAncestor(root->left, p, q);
        TreeNode* right = lowestCommonAncestor(root->right, p, q);

        return !left ? right : !right ? left : root;
    }
};
```

Runtime: 24 ms, faster than 95.33% of C++ online submissions for Lowest Common Ancestor of a Binary Tree.

Memory Usage: 16.8 MB, less than 40.70% of C++ online submissions for Lowest Common Ancestor of a Binary Tree.
