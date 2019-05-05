# binary-search-tree-to-greater-sum-tree

[https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/](https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/)

```
Given the root of a binary search tree with distinct values, modify it so that every node has a new value equal to the sum of the values of the original tree that are greater than or equal to node.val.

As a reminder, a binary search tree is a tree that satisfies these constraints:

The left subtree of a node contains only nodes with keys less than the node's key.
The right subtree of a node contains only nodes with keys greater than the node's key.
Both the left and right subtrees must also be binary search trees.


Example 1:
```
![https://assets.leetcode.com/uploads/2019/05/02/tree.png](https://assets.leetcode.com/uploads/2019/05/02/tree.png)
```

Input: [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
Output: [30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]


Note:

The number of nodes in the tree is between 1 and 100.
Each node will have value between 0 and 100.
The given tree is a binary search tree.
```

# solution

```c++
// O(n) Runtime, O(1) Space.
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
    TreeNode* bstToGst(TreeNode* root) {
        if (!root) return nullptr;
        vector<int> nums{};
        int sum = 0;
        getSum(root, sum);
        genGreater(root, sum);

        return root;
    }

    void getSum(TreeNode* root, int &sum) {
        if (!root) return;

        getSum(root->left, sum);
        sum += root->val;
        getSum(root->right, sum);
    }

    void genGreater(TreeNode* root, int &sum) {
        if (!root) return;

        genGreater(root->left, sum);

        int tmp = root->val;
        root->val = sum;
        sum -= tmp;
        genGreater(root->right, sum);
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Binary Search Tree to Greater Sum Tree.
//Memory Usage: 9.3 MB, less than 100.00% of C++ online submissions for Binary Search Tree to Greater Sum Tree.
```
