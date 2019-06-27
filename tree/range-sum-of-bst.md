# range-sum-of-bst

[https://leetcode.com/problems/range-sum-of-bst/](https://leetcode.com/problems/range-sum-of-bst/)

```
Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).

The binary search tree is guaranteed to have unique values.

 

Example 1:

Input: root = [10,5,15,3,7,null,18], L = 7, R = 15
Output: 32
Example 2:

Input: root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
Output: 23
 

Note:

The number of nodes in the tree is at most 10000.
The final answer is guaranteed to be less than 2^31.
```

# solution 

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
    int rangeSumBST(TreeNode* root, int L, int R) {
        int sum = 0;
        preorder(root, L, R, sum);
        
        return sum;
    }
    
    void preorder(TreeNode* root, int L, int R, int& sum) {
        if (!root) return;
        if (root->val >= L && root->val <= R) {
            sum += root->val;
        }
        
        preorder(root->left, L, R, sum);
        preorder(root->right, L, R, sum);
    }
};
//Runtime: 140 ms, faster than 93.74% of C++ online submissions for Range Sum of BST.
//Memory Usage: 41 MB, less than 98.39% of C++ online submissions for Range Sum of BST.
```