# binary-tree-right-side-view

[https://leetcode.com/problems/binary-tree-right-side-view/](https://leetcode.com/problems/binary-tree-right-side-view/)

```
Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

Example:

Input: [1,2,3,null,5,null,4]
Output: [1, 3, 4]
Explanation:

   1            <---
 /   \
2     3         <---
 \     \
  5     4       <---
```

# thinking

还是层序遍历，保留最后一个值就行了.

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
    vector<int> rightSideView(TreeNode* root) {
        vector<int> vec{};
        if (!root) return vec;
        int qLen = 0, rightSide;
        TreeNode *tmp;
        queue<TreeNode*> q{{root}};
        while (!q.empty()) {
            qLen = q.size();
            for (int i = 0; i < qLen; i++) {
                tmp = q.front();
                rightSide = tmp->val;
                q.pop();
                if (tmp->left)  q.push(tmp->left);
                if (tmp->right) q.push(tmp->right);
            }
            vec.push_back(rightSide);
        }

        return vec;
    }
};
```
Runtime: 4 ms, faster than 100.00% of C++ online submissions for Binary Tree Right Side View.

Memory Usage: 9.7 MB, less than 32.50% of C++ online submissions for Binary Tree Right Side View.
