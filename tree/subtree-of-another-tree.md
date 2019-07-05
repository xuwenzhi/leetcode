# subtree-of-another-tree

[https://leetcode.com/problems/subtree-of-another-tree/](https://leetcode.com/problems/subtree-of-another-tree/)

```
Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.

Example 1:
Given tree s:

     3
    / \
   4   5
  / \
 1   2
Given tree t:
   4 
  / \
 1   2
Return true, because t has the same structure and node values with a subtree of s.
Example 2:
Given tree s:

     3
    / \
   4   5
  / \
 1   2
    /
   0
Given tree t:
   4
  / \
 1   2
Return false.
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
    void isSubTree(TreeNode* s, TreeNode* t, int& res) {
        if (!res) return;
        if (!s && !t) return;
        if ((s && !t) || (!s && t)) {
            res = false;
            return;
        }
        if (s->val != t->val) {
            res = false;
            return;
        }
        isSubTree(s->left, t->left, res);
        isSubTree(s->right, t->right, res);
    }
    
    void preorder(TreeNode* s, TreeNode* t, int& res) {
        if (!s || res) return;
        if (s->val == t->val) {
            res = true; // 每次进入是否是子树判断前都将res置为true
            isSubTree(s, t, res);
            // 如果经过isSubTree()之后的res依然为true，那么最终结果也为true
            if (res) res = true;
        }
        
        preorder(s->left, t, res);
        preorder(s->right, t, res);
    }
    
    bool isSubtree(TreeNode* s, TreeNode* t) {
        if (!t && !s) return true;
        if (!t) return false;
        int res = 0;
        preorder(s, t, res);
        
        return res;
    }
};
//Runtime: 32 ms, faster than 74.44% of C++ online submissions for Subtree of Another Tree.
//Memory Usage: 20.9 MB, less than 64.57% of C++ online submissions for Subtree of Another Tree.
```
