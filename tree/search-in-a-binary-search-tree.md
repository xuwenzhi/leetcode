# search-in-a-binary-search-tree

[https://leetcode.com/problems/search-in-a-binary-search-tree/](https://leetcode.com/problems/search-in-a-binary-search-tree/)

Given the root node of a binary search tree (BST) and a value. You need to find the node in the BST that the node's value equals the given value. Return the subtree rooted with that node. If such node doesn't exist, you should return NULL.

For example,

Given the tree:
        4
       / \
      2   7
     / \
    1   3

And the value to search: 2
You should return this subtree:

      2
     / \
    1   3
In the example above, if we want to search the value 5, since there is no node with value 5, we should return NULL.

Note that an empty tree is represented by NULL, therefore you would see the expected output (serialized tree format) as [], not null.

# thinking

这个最开始给的solution还是使用了queue去层序遍历。不过既然是二叉搜索树，其实可以做一些优化，比如每次push到queue前进行判断，就可以少push一半的节点。另外其实不需要queue也可以达到效果，类似于二分查找，最下面有这种的解决方案.

# solution (queue)

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
    TreeNode* searchBST(TreeNode* root, int val) {
        if (!root) return root;
        int qLen = 0;
        queue<TreeNode*> q{{root}};
        TreeNode* tmp;
        while (!q.empty()) {
            qLen = q.size();
            for (int i = 0; i < qLen; i++) {
                tmp = q.front();
                if (tmp->val == val) {
                    return tmp;
                }
                q.pop();
                if (tmp->left) q.push(tmp->left);
                if (tmp->right) q.push(tmp->right);
            }
        }

        return nullptr;
    }
};
```

Runtime: 60 ms, faster than 94.29% of C++ online submissions for Search in a Binary Search Tree.

Memory Usage: 29.2 MB, less than 77.22% of C++ online submissions for Search in a Binary Search Tree.



# solution (iteration)

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
    TreeNode* searchBST(TreeNode* root, int val) {
        if (!root) return root;
        TreeNode* cur = root;
        while (cur != NULL) {
            if (cur->val == val) {
                return cur;
            } else if (cur->val > val) {
                cur = cur->left;
            } else {
                cur = cur->right;
            }
        }
        return nullptr;
    }
};
```
