# flatten-binary-tree-to-linked-list

[https://leetcode.com/problems/flatten-binary-tree-to-linked-list/](https://leetcode.com/problems/flatten-binary-tree-to-linked-list/)

```
Given a binary tree, flatten it to a linked list in-place.

For example, given the following tree:

    1
   / \
  2   5
 / \   \
3   4   6
The flattened tree should look like:

1
 \
  2
   \
    3
     \
      4
       \
        5
         \
          6
```

# thinking

按照题目例子的话，需要对树进行一个先序遍历，代码中使用递归进行先序遍历，然后保存在一个vector数组中，然后再回到主程序更新root节点的right，不过需要开辟节点空间就可以了。

- 不过不好的地方，可能就是没有销毁原树的节点地址空间.

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
    void flatten(TreeNode* &root) {
        if (!root) return;
        vector<int> vec{};
        preOrder(root, vec);

        root->left = nullptr;
        root->right = nullptr;
        TreeNode* pre = root;
        for (int i = 1; i < vec.size();i++) {
            TreeNode* node = new TreeNode(vec[i]);
            node->left = nullptr;
            node->right = nullptr;
            pre->right = node;
            pre = pre->right;
        }
    }

    void preOrder(TreeNode* root, vector<int> &vec) {
        vec.push_back(root->val);
        if (root->left) preOrder(root->left, vec);
        if (root->right) preOrder(root->right, vec);
    }
};
```

Runtime: 8 ms, faster than 100.00% of C++ online submissions for Flatten Binary Tree to Linked List.

Memory Usage: 10.4 MB, less than 99.29% of C++ online submissions for Flatten Binary Tree to Linked List.
