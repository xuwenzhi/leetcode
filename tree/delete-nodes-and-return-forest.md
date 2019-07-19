# delete-nodes-and-return-forest

[https://leetcode.com/problems/delete-nodes-and-return-forest/](https://leetcode.com/problems/delete-nodes-and-return-forest/)

```
Given the root of a binary tree, each node in the tree has a distinct value.

After deleting all nodes with a value in to_delete, we are left with a forest (a disjoint union of trees).

Return the roots of the trees in the remaining forest.  You may return the result in any order.

 

Example 1:

```
![](https://assets.leetcode.com/uploads/2019/07/01/screen-shot-2019-07-01-at-53836-pm.png)
```


Input: root = [1,2,3,4,5,6,7], to_delete = [3,5]
Output: [[1,2,null,4],[6],[7]]
 

Constraints:

The number of nodes in the given tree is at most 1000.
Each node has a distinct value between 1 and 1000.
to_delete.length <= 1000
to_delete contains distinct values between 1 and 1000.
```

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
private:
    unordered_map<int, bool> m;
public:
    void helper(TreeNode* root, TreeNode* pre, bool is_left, bool is_root, vector<TreeNode*>& res) {
        if (!root) return;
        
        TreeNode* left = root->left;
        TreeNode* right = root->right;
        
        if (m.find(root->val) != m.end()) {
            // 如果根节点本身就是需要delete
            if (!pre) {
                helper(left, nullptr, true, true, res);
                helper(right, nullptr, false, true, res);
                return;
            }
            if (is_left) {
                pre->left = nullptr;
            } else {
                pre->right = nullptr;
            }
            root = nullptr;
        } else {
            // 如果是根节点，并且pre节点为null
            if (is_root && !pre) {
                res.push_back(root);
                is_root = false;
            }
        }
        
        helper(left, root, true, root == nullptr ? true : is_root, res);
        helper(right, root, false, root == nullptr ? true : is_root, res);
    }
    
    vector<TreeNode*> delNodes(TreeNode* root, vector<int>& to_delete) {
        vector<TreeNode*> res;
        for (auto d:to_delete) 
            m[d] = true;
        
        helper(root, nullptr, true, true, res);
        
        return res;
    }
};
//Runtime: 28 ms, faster than 44.05% of C++ online submissions for Delete Nodes And Return Forest.
//Memory Usage: 19.3 MB, less than 100.00% of C++ online submissions for Delete Nodes And Return Forest.
```

# solution (simply)

一种更加简洁的写法。

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
private:
    unordered_map<int, bool> m;
public:
    TreeNode* helper(TreeNode* root, bool is_root, vector<TreeNode*>& res) {
        if (!root) return nullptr;
        bool should_delete = m.find(root->val) != m.end();
        if (is_root && !should_delete) {
            res.push_back(root);
        }
        is_root = should_delete;
        root->left = helper(root->left, is_root, res);
        root->right = helper(root->right, is_root, res);
        
        return should_delete ? nullptr : root;
    }
    
    vector<TreeNode*> delNodes(TreeNode* root, vector<int>& to_delete) {
        vector<TreeNode*> res;
        for (auto d:to_delete) 
            m[d] = true;
        
        helper(root, true, res);
        
        return res;
    }
};
//Runtime: 24 ms, faster than 72.61% of C++ online submissions for Delete Nodes And Return Forest.
//Memory Usage: 18.8 MB, less than 100.00% of C++ online submissions for Delete Nodes And Return Forest.
```