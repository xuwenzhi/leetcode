# validate-binary-search-tree

[https://leetcode.com/problems/validate-binary-search-tree/](https://leetcode.com/problems/validate-binary-search-tree/)

```
Given a binary tree, determine if it is a valid binary search tree (BST).

Assume a BST is defined as follows:

The left subtree of a node contains only nodes with keys less than the node's key.
The right subtree of a node contains only nodes with keys greater than the node's key.
Both the left and right subtrees must also be binary search trees.
Example 1:

Input:
    2
   / \
  1   3
Output: true
Example 2:

    5
   / \
  1   4
     / \
    3   6
Output: false
Explanation: The input is: [5,1,4,null,null,3,6]. The root node's value
             is 5 but its right child's value is 4.
```

# thinking
这里采用的是中序遍历二叉树，得到一个理论上由小到大的数组，然后再遍历判断就可以了.

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
    bool isValidBST(TreeNode* root) {
        if (!root) return true;
        vector<int> vec{};
        helper(root, vec);

        for (int i = 0; i < vec.size()-1; i++) {
            if (vec[i] >= vec[i+1]) return false;
        }

        return true;
    }

    void helper(TreeNode* root, vector<int> &vec) {
        if (!root) return;
        helper(root->left, vec);
        vec.push_back(root->val);
        helper(root->right, vec);
    }
};
//Runtime: 20 ms, faster than 99.27% of C++ online submissions for Validate Binary Search Tree.
//Memory Usage: 21 MB, less than 14.35% of C++ online submissions for Validate Binary Search Tree.
```


# solution 2020.2.13

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
    bool isValidBst(TreeNode* root, TreeNode* minNode, TreeNode* maxNode) {
        if (!root) return true;
        if ((minNode && root->val <= minNode->val) || (maxNode && root->val >= maxNode->val))
            return false;

        return isValidBst(root->left, minNode, root) && isValidBst(root->right, root, maxNode);
    }

    bool isValidBST(TreeNode* root) {
        return isValidBst(root, nullptr, nullptr);
    }
};
//Runtime: 20 ms, faster than 33.26% of C++ online submissions for Validate Binary Search Tree.
//Memory Usage: 20.7 MB, less than 80.21% of C++ online submissions for Validate Binary Search Tree.
```


# reference

[C++ simple recursive solution](https://leetcode.com/problems/validate-binary-search-tree/discuss/32141/)
