# inorder-successor-in-bst

[https://leetcode.com/problems/inorder-successor-in-bst]/(https://leetcode.com/problems/inorder-successor-in-bst/)

``
Given a binary search tree and a node in it, find the in-order successor of that node in the BST.

The successor of a node p is the node with the smallest key greater than p.val.



Example 1:

```
![https://assets.leetcode.com/uploads/2019/01/23/285_example_1.PNG](https://assets.leetcode.com/uploads/2019/01/23/285_example_1.PNG)
```

Input: root = [2,1,3], p = 1
Output: 2
Explanation: 1's in-order successor node is 2. Note that both p and the return value is of TreeNode type.
Example 2:

```
![https://assets.leetcode.com/uploads/2019/01/23/285_example_2.PNG](https://assets.leetcode.com/uploads/2019/01/23/285_example_2.PNG)
```
Input: root = [5,3,6,2,4,null,null,1], p = 6
Output: null
Explanation: There is no in-order successor of the current node, so the answer is null.


Note:

If the given node has no in-order successor in the tree, return null.
It's guaranteed that the values of the tree are unique.
```

# solution (vector<TreeNode*>)

直接来个 inorder 将节点存储在vector中，然后遍历vector得到结果。

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
    void inorder(TreeNode* root, TreeNode* p) {
        if (!root) return;
        inorder(root->left, p);
        v.push_back(root);
        inorder(root->right, p);
    }

    TreeNode* inorderSuccessor(TreeNode* root, TreeNode* p) {
        inorder(root, p);
        for (int i=0;i<v.size();i++) {
            if (v[i] == p) {
                return i < v.size()-1 ? v[i+1] : nullptr;
            }
        }

        return nullptr;
    }
private:
    vector<TreeNode*> v;
};
//Runtime: 40 ms, faster than 46.77% of C++ online submissions for Inorder Successor in BST.
//Memory Usage: 25.5 MB, less than 29.41% of C++ online submissions for Inorder Successor in BST.
```

# solution (stack inorder)

其实递归 inorder 的话，在某种层面还挺蹩脚的，直接来个 stack inorder 则很容易取得下一个该遍历的值，这样就减少了递归次数。

```c++
// Runtime O(n), Space O(n)
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
    TreeNode* inorderSuccessor(TreeNode* root, TreeNode* p) {
        if (!root) return nullptr;
        stack<TreeNode*> s;
        TreeNode* current = root;
        bool find = false;
        while (!s.empty() || current) {
            while (current) {
                s.push(current); current = current->left;
            }
            current = s.top(); s.pop();
            if (find) return current; // 如果find 已经为true了，那么直接返回现在的current正是时候.
            if (current->val == p->val) {
                find = true;
            }
            current = current->right;
        }

        return nullptr;
    }
};
//Runtime: 36 ms, faster than 75.99% of C++ online submissions for Inorder Successor in BST.
//Memory Usage: 24.6 MB, less than 100.00% of C++ online submissions for Inorder Successor in BST.
```
