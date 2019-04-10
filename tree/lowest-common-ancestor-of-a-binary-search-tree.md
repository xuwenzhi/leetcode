# lowest-common-ancestor-of-a-binary-search-tree

[https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/)

```
Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.

According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

Given binary search tree:  root = [6,2,8,0,4,7,9,null,null,3,5]


![https://assets.leetcode.com/uploads/2018/12/14/binarysearchtree_improved.png](https://assets.leetcode.com/uploads/2018/12/14/binarysearchtree_improved.png)

Example 1:

Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
Output: 6
Explanation: The LCA of nodes 2 and 8 is 6.
Example 2:

Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
Output: 2
Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.


Note:

All of the nodes' values will be unique.
p and q are different and both values will exist in the BST.
```

# thinking

这个题之前还真没做过，所以我的思路是先记录两个节点的path，这里做了点处理，会得到一个map以及一个vector<TreeNode*>，然后在vector<TreeNode*>的尾部向前遍历，计算当前元素是否存在于map中，得到最终结果，不过效果不尽如人意啊~

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
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        vector<TreeNode*> pre, qv;
        unordered_map<TreeNode*, int> map;
        helper(root, pre, map, qv, p, q);

        for (int i = qv.size()-1;i>=0;i--) {
            if (map.find(qv[i]) != map.end()) {
                return qv[i];
            }
        }
        return root;
    }

    void helper(TreeNode* root, vector<TreeNode*>pre, unordered_map<TreeNode*, int> &map, vector<TreeNode*> &qv, TreeNode* p, TreeNode* q) {
        if (!root) return;
        if (map.size() && qv.size()) return;

        pre.push_back(root);
        if (root->val == p->val) {
            for (int i = 0; i < pre.size();i++) {
                map.insert(std::make_pair(pre[i], pre[i]->val));
            }
        }
        if (root->val == q->val) {
            qv = pre;
        }
        helper(root->left, pre, map, qv, p, q);
        helper(root->right, pre, map, qv, p, q);
    }
};
```
Runtime: 100 ms, faster than 13.57% of C++ online submissions for Lowest Common Ancestor of a Binary Search Tree.

Memory Usage: 60.6 MB, less than 5.39% of C++ online submissions for Lowest Common Ancestor of a Binary Search Tree.


# thinking2

真是没好好审题啊，实际上这是一个BST啊，上一个方案完全没有考虑这一点。。。

# solution 2

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
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        if ((root->val - p->val) * (root->val - q->val) <= 1) return root;
        if (p->val < root->val)
            return lowestCommonAncestor(root->left, p, q);
        else
            return lowestCommonAncestor(root->right, p, q);
    }
};
```

Runtime: 44 ms, faster than 96.80% of C++ online submissions for Lowest Common Ancestor of a Binary Search Tree.

Memory Usage: 25.8 MB, less than 58.85% of C++ online submissions for Lowest Common Ancestor of a Binary Search Tree.
