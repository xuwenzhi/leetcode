# convert-bst-to-greater-tree

[https://leetcode.com/problems/convert-bst-to-greater-tree/](https://leetcode.com/problems/convert-bst-to-greater-tree/)

```
Given a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.

Example:

Input: The root of a Binary Search Tree like this:
              5
            /   \
           2     13

Output: The root of a Greater Tree like this:
             18
            /   \
          20     13
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
    TreeNode* convertBST(TreeNode* root) {
        if (!root) return nullptr;
        int sum = 0;
        getSum(root, sum);
        cout<<sum<<endl;
        genGreater(root, sum);

        return root;
    }

    void getSum(TreeNode* root, int &sum) {
        if (!root) return;
        sum += root->val;
        getSum(root->left, sum);
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
//Runtime: 44 ms, faster than 78.38% of C++ online submissions for Convert BST to Greater Tree.
//Memory Usage: 23.8 MB, less than 99.09% of C++ online submissions for Convert BST to Greater Tree.
```
