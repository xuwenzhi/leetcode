# cousins-in-binary-tree

[https://leetcode.com/problems/cousins-in-binary-tree/](https://leetcode.com/problems/cousins-in-binary-tree/)

```
n a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.

Two nodes of a binary tree are cousins if they have the same depth, but have different parents.

We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.

Return true if and only if the nodes corresponding to the values x and y are cousins.



Example 1:
```
![https://assets.leetcode.com/uploads/2019/02/12/q1248-01.png](https://assets.leetcode.com/uploads/2019/02/12/q1248-01.png)
```
Input: root = [1,2,3,4], x = 4, y = 3
Output: false
Example 2:
```
![https://assets.leetcode.com/uploads/2019/02/12/q1248-02.png](https://assets.leetcode.com/uploads/2019/02/12/q1248-02.png)
```
Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
Output: true
Example 3:
```
![https://assets.leetcode.com/uploads/2019/02/13/q1248-03.png](https://assets.leetcode.com/uploads/2019/02/13/q1248-03.png)
```
Input: root = [1,2,3,null,4], x = 2, y = 3
Output: false


Note:

The number of nodes in the tree will be between 2 and 100.
Each node has a unique integer value from 1 to 100.
```

# thinking

还是采用层序遍历方式，因为这个整个树节点的值都是唯一的，所以通过一个简单的**isOneEqual()**方法来进行判断，如果在这其中，对第一个命中的点的父节点targetNode还有depth赋值，所以注意点就是也不要忘记比较深度，如果深度不同，那也就不是cousin了.

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
    bool isOneEqual(int target, int x, int y) {
        if (target == x || target == y) return true;
        return false;
    }

    bool isCousins(TreeNode* root, int x, int y) {
        vector<vector<int>> vec{};
        if (!root) return false;
        int qLen = 0, depth = 0, index = 0;
        TreeNode* targetNode = nullptr;
        TreeNode* tmp;
        queue<TreeNode*> q{{root}};
        if (root->val == x || root->val == y) return false;
        while (!q.empty()) {
            qLen = q.size();
            for (int i = 0; i < qLen; i++) {
                tmp = q.front();
                q.pop();
                if (tmp->left) {
                    if (isOneEqual(tmp->left->val, x, y)) {
                        if (targetNode) {
                            return targetNode != tmp && depth == index;
                        } else {
                            targetNode = tmp;
                            depth = index;
                        }
                    }
                    q.push(tmp->left);
                }
                if (tmp->right) {
                    if (isOneEqual(tmp->right->val, x, y)) {
                        if (targetNode) {
                            return targetNode != tmp && depth == index;
                        } else {
                            targetNode = tmp;
                            depth = index;
                        }
                    }
                    q.push(tmp->right);
                }
            }
            index++;
        }

        return false;
    }
};
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Cousins in Binary Tree.

Memory Usage: 11.3 MB, less than 99.82% of C++ online submissions for Cousins in Binary Tree.
