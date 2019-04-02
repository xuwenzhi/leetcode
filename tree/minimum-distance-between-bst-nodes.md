# minimum-distance-between-bst-nodes

[https://leetcode.com/problems/minimum-distance-between-bst-nodes/](https://leetcode.com/problems/minimum-distance-between-bst-nodes/)

```
Given a Binary Search Tree (BST) with the root node root, return the minimum difference between the values of any two different nodes in the tree.

Example :

Input: root = [4,2,6,1,3,null,null]
Output: 1
Explanation:
Note that root is a TreeNode object, not an array.

The given tree [4,2,6,1,3,null,null] is represented by the following diagram:

          4
        /   \
      2      6
     / \
    1   3

while the minimum difference in this tree is 1, it occurs between node 1 and node 2, also between node 3 and node 2.
Note:

The size of the BST will be between 2 and 100.
The BST is always valid, each node's value is an integer, and each node's value is different.
```

# thinking

此题是求解两个节点差的最小值，既然是BST，使用中序遍历(左->中->右)，遍历之后得到一个int数组，然后计算遍历数组计算数组间的值找到最小值即可了。

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
    int minDiffInBST(TreeNode* root) {
        vector<int> vec{};
        int res = INT_MAX;
        minimum(root, vec);
        for (int i = 1; i < vec.size(); i++) {
            res = min(res, vec[i] - vec[i-1]);
        }
        return res;
    }

    void minimum(TreeNode* root, vector<int> &vec) {
        if (!root) return;

        minimum(root->left, vec);
        vec.push_back(root->val);
        minimum(root->right, vec);
    }
};
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Minimum Distance Between BST Nodes.

Memory Usage: 11.5 MB, less than 23.38% of C++ online submissions for Minimum Distance Between BST Nodes.
