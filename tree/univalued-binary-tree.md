# univalued-binary-tree

[https://leetcode.com/problems/univalued-binary-tree/](https://leetcode.com/problems/univalued-binary-tree/)

```
A binary tree is univalued if every node in the tree has the same value.

Return true if and only if the given tree is univalued.



Example 1:
```
![https://assets.leetcode.com/uploads/2018/12/28/unival_bst_1.png](https://assets.leetcode.com/uploads/2018/12/28/unival_bst_1.png)
```

Input: [1,1,1,1,1,null,1]
Output: true
Example 2:
```
![https://assets.leetcode.com/uploads/2018/12/28/unival_bst_2.png](https://assets.leetcode.com/uploads/2018/12/28/unival_bst_2.png)
```
Input: [2,2,2,5,2]
Output: false

Note:

The number of nodes in the given tree will be in the range [1, 100].
Each node's value will be an integer in the range [0, 99].
```

# thinking

找准根节点的基准值，然后挨个遍历吧.

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
    bool isUnivalTree(TreeNode* root) {
        if (!root) return true;
        queue<TreeNode*> q{{root}};
        int benchmark = root->val, qLen = 0;
        TreeNode* tmp;
        while (!q.empty()) {
            qLen = q.size();
            for (int i = 0; i < qLen; i++) {
                tmp = q.front();
                if (tmp->val != benchmark) {
                    return false;
                }
                q.pop();
                if (tmp->left) q.push(tmp->left);
                if (tmp->right) q.push(tmp->right);
            }
        }
        return true;
    }

};
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Univalued Binary Tree.

Memory Usage: 10.7 MB, less than 99.47% of C++ online submissions for Univalued Binary Tree.
