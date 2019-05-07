# find-bottom-left-tree-value

[https://leetcode.com/problems/find-bottom-left-tree-value/](https://leetcode.com/problems/find-bottom-left-tree-value/)

```
Given a binary tree, find the leftmost value in the last row of the tree.

Example 1:

Input:

    2
   / \
  1   3

Output:
1
Example 2:

Input:

        1
       / \
      2   3
     /   / \
    4   5   6
       /
      7

Output:
7
Note: You may assume the tree (i.e., the given root node) is not NULL.
```

# thinking

这道题是找到最底层最左边的节点的值，所以可以使用队列来个层序遍历，然后每层取第一个节点的值就可以了。

# solution (bfs)

```c++
// O(h) Runtime, O(n) Space.
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
    int findBottomLeftValue(TreeNode* root) {
        if (!root) return 0;
        int l=0;
        queue<TreeNode*> q{{root}};
        int res = root->val;
        while (!q.empty()) {
            l = q.size();
            int flag = true;
            for (int i=0;i<l;i++) {
                TreeNode* tmp = q.front();
                q.pop();
                if (flag) {
                    res  = tmp->val;
                    flag = false;
                }
                if (tmp->left) q.push(tmp->left);
                if (tmp->right) q.push(tmp->right);
            }
        }

        return res;
    }
};
//Runtime: 20 ms, faster than 98.97% of C++ online submissions for Find Bottom Left Tree Value.
//Memory Usage: 21 MB, less than 95.56% of C++ online submissions for Find Bottom Left Tree Value.
```
