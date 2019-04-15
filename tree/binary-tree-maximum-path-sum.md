# binary-tree-maximum-path-sum

[https://leetcode.com/problems/binary-tree-maximum-path-sum/](https://leetcode.com/problems/binary-tree-maximum-path-sum/)

```
Given a non-empty binary tree, find the maximum path sum.

For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

Example 1:

Input: [1,2,3]

       1
      / \
     2   3

Output: 6
Example 2:

Input: [-10,9,20,null,null,15,7]

   -10
   / \
  9  20
    /  \
   15   7

Output: 42
```

# thinking

这个题还是有点意思的，要不怎么说是个Hard呢。解决方案也是有几个巧劲儿，既然是求一个路径，那么正常情况下会交汇在一个根节点(当然还是存在不正常的情况)，所以使用一个全局的reference来保存路径sum(root->val + left + right)，而函数返回呢？只返回 **ret = current + max(left, right)**。

还有一个巧劲儿是，假如当前计算的ret为负，则忽略掉。

实际上，真正关心的值是**maxPath**.

# solution
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
    int maxPathSum(TreeNode* root) {
        int maxPath = INT_MIN; // store parent node max sum
        maxSum(root, maxPath);

        return maxPath;
    }

    int maxSum(TreeNode* node, int &maxPath) {
        if (!node) return 0;

        int left = maxSum(node->left, maxPath);
        int right = maxSum(node->right, maxPath);
        int current = node->val;

        maxPath = max(current+left+ right, maxPath);
        int res = current + max(left, right);

        return res > 0 ? res : 0; // trick here, if res is nagetive, dont care this subtree.
    }
};
//Runtime: 36 ms, faster than 98.75% of C++ online submissions for Binary Tree Maximum Path Sum.
//Memory Usage: 24.4 MB, less than 91.30% of C++ online submissions for Binary Tree Maximum Path Sum.
```
