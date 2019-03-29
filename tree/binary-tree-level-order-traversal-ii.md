# binary-tree-level-order-traversal-ii

[https://leetcode.com/problems/binary-tree-level-order-traversal-ii/](https://leetcode.com/problems/binary-tree-level-order-traversal-ii/)

```
Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

For example:
Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
return its bottom-up level order traversal as:

[
  [15,7],
  [9,20],
  [3]
]
```

# thinking

和[[medium]binary-tree-level-order-traversal](https://github.com/xuwenzhi/leetcode/blob/master/tree/binary-tree-level-order-traversal.md)一个意思，不过就是增加了一道reverse操作。别的思路应该也可以，比如说用栈解决，如果用栈的话需要考虑好数组维度关系，用一个标记位或者中间分割点应该也可以解决.

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
    vector<vector<int>> levelOrderBottom(TreeNode* root) {
        vector<vector<int>> vec{};
        if (!root) return vec;
        int index = 0, qLen = 0;
        TreeNode* tmp;
        vector<int> col;
        queue<TreeNode*> q{{root}};
        while (!q.empty()) {
            col.clear();
            qLen = q.size();
            for (int i = 0; i < qLen; i++) {
                tmp = q.front();
                q.pop();
                col.push_back(tmp->val);
                if (tmp->left)  q.push(tmp->left);
                if (tmp->right) q.push(tmp->right);
            }
            vec.push_back(col);
            index++;
        }

        reverse(std::begin(vec), std::end(vec));

        return vec;
    }
};
```

Runtime: 8 ms, faster than 100.00% of C++ online submissions for Binary Tree Level Order Traversal II.

Memory Usage: 13.7 MB, less than 91.78% of C++ online submissions for Binary Tree Level Order Traversal II.
