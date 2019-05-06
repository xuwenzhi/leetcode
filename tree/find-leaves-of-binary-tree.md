# find-leaves-of-binary-tree

[https://leetcode.com/problems/find-leaves-of-binary-tree/](https://leetcode.com/problems/find-leaves-of-binary-tree/)

```
Given a binary tree, collect a tree's nodes as if you were doing this: Collect and remove all leaves, repeat until the tree is empty.



Example:

Input: [1,2,3,4,5]

          1
         / \
        2   3
       / \
      4   5

Output: [[4,5,3],[2],[1]]


Explanation:

1. Removing the leaves [4,5,3] would result in this tree:

          1
         /
        2


2. Now removing the leaf [2] would result in this tree:

          1


3. Now removing the leaf [1] would result in the empty tree:

          []
```


# solution (loop remove leaf)

因为是每次移除树的叶子节点，所以单纯的层序遍历是不可行的，所以我的方案是每次对树进行先序遍历，当发现是叶子节点，则将值取出并且将此节点置为NULL，一次遍历之后，原树的叶子节点都没了，又有新的叶子节点出现，重复进行刚刚的操作，直到root节点为NULL.

```c++
// O(n*n) Runtime, O(n) Space.
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
    vector<vector<int>> findLeaves(TreeNode* root) {
        vector<vector<int>> res{};
        vector<int> leaf{};

        while (root) {
            preorder(root, res, res.size());
        }

        return res;
    }

    void preorder(TreeNode* &root, vector<vector<int>> &res, int index) {
        if (!root) return;

        if (!root->left && !root->right) {
            if (res.size() == index) {
                res.push_back({root->val});
            } else {
                res[index].push_back(root->val);
            }
            root = nullptr;
            return;
        }

        preorder(root->left, res, index);
        preorder(root->right, res, index);
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Find Leaves of Binary Tree.
//Memory Usage: 9.7 MB, less than 72.00% of C++ online submissions for Find Leaves of Binary Tree.
```

# solution (bottom to top)

这个解决方案是自底向上逐步推导出节点所在数组的位置，即**通过深度即可得到**，总体时间复杂度为O(n)，相较于上面的方案来说会快很多，不过应该是由于case的缘故，两个方案差距不大.

```c++
// O(n) Runtime, O(n) Space.
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
    vector<vector<int>> findLeaves(TreeNode* root) {
        vector<vector<int>> res{};
        preorder(root, res);

        return res;
    }

    int preorder(TreeNode* root, vector<vector<int>> &res) {
        if (!root) return -1;
        int level = 1 + max(preorder(root->left, res), preorder(root->right, res));
        if (res.size() < level+1)
            res.push_back({});

        res[level].push_back(root->val);
        return level;
    }
};
//Runtime: 4 ms, faster than 100.00% of C++ online submissions for Find Leaves of Binary Tree.
//Memory Usage: 9.8 MB, less than 62.00% of C++ online submissions for Find Leaves of Binary Tree.
```
