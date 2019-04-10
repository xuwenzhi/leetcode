# binary-tree-paths

[https://leetcode.com/problems/binary-tree-paths/](https://leetcode.com/problems/binary-tree-paths/)

```
Given a binary tree, return all root-to-leaf paths.

Note: A leaf is a node with no children.

Example:

Input:

   1
 /   \
2     3
 \
  5

Output: ["1->2->5", "1->3"]

Explanation: All root-to-leaf paths are: 1->2->5, 1->3
```

# thinking

这个题和[[Easy]path-sum](https://github.com/xuwenzhi/leetcode/blob/master/tree/path-sum.md)还是一个路数，只不过就是不太好弄输出而已，怪就怪在这个输出。


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
    vector<string> binaryTreePaths(TreeNode* root) {
        string pre = "";
        vector<string> res{};
        preorder(root, pre, res);

        return res;
    }

    void preorder(TreeNode* root, string pre, vector<string> &vec) {
        if (!root) return ;
        if (root->left || root->right) {
            pre += to_string(root->val) + "->";
        } else {
            pre += to_string(root->val);
            vec.push_back(pre);
        }
        preorder(root->left, pre, vec);
        preorder(root->right, pre, vec);
    }
};
```

Runtime: 8 ms, faster than 94.10% of C++ online submissions for Binary Tree Paths.

Memory Usage: 12.4 MB, less than 78.49% of C++ online submissions for Binary Tree Paths.
