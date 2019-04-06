# sum-root-to-leaf-numbers

[https://leetcode.com/problems/sum-root-to-leaf-numbers/](https://leetcode.com/problems/sum-root-to-leaf-numbers/)

```
Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.

An example is the root-to-leaf path 1->2->3 which represents the number 123.

Find the total sum of all root-to-leaf numbers.

Note: A leaf is a node with no children.

Example:

Input: [1,2,3]
    1
   / \
  2   3
Output: 25
Explanation:
The root-to-leaf path 1->2 represents the number 12.
The root-to-leaf path 1->3 represents the number 13.
Therefore, sum = 12 + 13 = 25.
Example 2:

Input: [4,9,0,5,1]
    4
   / \
  9   0
 / \
5   1
Output: 1026
Explanation:
The root-to-leaf path 4->9->5 represents the number 495.
The root-to-leaf path 4->9->1 represents the number 491.
The root-to-leaf path 4->0 represents the number 40.
Therefore, sum = 495 + 491 + 40 = 1026.
```

# thinking

It's nothing to talk about it.

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
    int sumNumbers(TreeNode* root) {
        vector<long> res{};
        helper(root, 0, res);
        
        return accumulate(res.begin(), res.end(),0);
    }
    
    void helper(TreeNode* root, int pre, vector<long> &res) {
        if (!root) return;
        
        pre = pre * 10 + root->val;
        if (root->left == nullptr 
           && root->right == nullptr) {
            res.push_back(pre);
            return;
        }
        
        helper(root->left, pre, res);
        helper(root->right, pre, res);
    }
    
};
```

Runtime: 8 ms, faster than 81.22% of C++ online submissions for Sum Root to Leaf Numbers.

Memory Usage: 12.5 MB, less than 36.31% of C++ online submissions for Sum Root to Leaf Numbers.

