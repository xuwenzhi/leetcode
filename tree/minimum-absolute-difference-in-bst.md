# minimum-absolute-difference-in-bst

[https://leetcode.com/problems/minimum-absolute-difference-in-bst/](https://leetcode.com/problems/minimum-absolute-difference-in-bst/)

```
Given a binary search tree with non-negative values, find the minimum absolute difference between values of any two nodes.

Example:

Input:

   1
    \
     3
    /
   2

Output:
1

Explanation:
The minimum absolute difference is 1, which is the difference between 2 and 1 (or between 2 and 3).
 

Note: There are at least two nodes in this BST.
```

# solution (vector)

inorder遍历一遍，把结果存储到vector里，然后在计算vector相邻两个值的查。

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
    int getMinimumDifference(TreeNode* root) {
        if (!root) return 0;
        int res = INT_MAX;
        vector<int> v;
        inorder(root, v);
        for (int i=1;i<v.size();i++) {
            res = min(res, v[i] - v[i-1]);
        }
        
        return res;
    }
    
    void inorder(TreeNode* root, vector<int>& v) {
        if (!root) return;
        
        inorder(root->left, v);
        v.push_back(root->val);
        inorder(root->right, v);
    }
};
//Runtime: 24 ms, faster than 69.04% of C++ online submissions for Minimum Absolute Difference in BST.
//Memory Usage: 22.2 MB, less than 36.14% of C++ online submissions for Minimum Absolute Difference in BST.
```


# solution (no vector)

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
    int getMinimumDifference(TreeNode* root) {
        if (!root) return 0;
        int res = INT_MAX, pre = -1;
        inorder(root, pre, res);
        
        return res;
    }
    
    void inorder(TreeNode* root, int& pre, int& res) {
        if (!root) return;
        inorder(root->left, pre, res);
        if (pre >= 0) {
            res = min(res, root->val - pre);
        }
        pre = root->val;
        inorder(root->right, pre, res);
    }
};
//Runtime: 16 ms, faster than 96.04% of C++ online submissions for Minimum Absolute Difference in BST.
//Memory Usage: 21.7 MB, less than 85.26% of C++ online submissions for Minimum Absolute Difference in BST.
```