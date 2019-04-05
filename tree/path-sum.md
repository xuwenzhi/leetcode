# path-sum

[https://leetcode.com/problems/path-sum/](https://leetcode.com/problems/path-sum/)

```
Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.

Note: A leaf is a node with no children.

Example:

Given the below binary tree and sum = 22,

      5
     / \
    4   8
   /   / \
  11  13  4
 /  \      \
7    2      1
return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
```
# thinking

来个preorder遍历，然后计算总数就好了，这里为了能够减少遍历次数，使用了一个**res**来记录，如果出现了path-sum，就返回即可了。


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
    bool hasPathSum(TreeNode* root, int sum) {
        if (!root) return false;
        int res = 0; 
        res = helper(root, 0, sum, res);
        return res;
    }
    
    int helper(TreeNode* root, int pre, int sum, int &res) {
        if (!root) return 0;
        if (res) return res;
        
        if (root->left == nullptr && root->right == nullptr && root->val + pre == sum) {
            res = 1;
            return 1;
        }
        int result = 0; 
        result += helper(root->left, pre + root->val, sum, res);
        result += helper(root->right, pre + root->val, sum, res);
        
        return result;
    }
};
```
Runtime: 16 ms, faster than 99.60% of C++ online submissions for Path Sum.

Memory Usage: 19.7 MB, less than 91.92% of C++ online submissions for Path Sum.
