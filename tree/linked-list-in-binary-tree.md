# linked-list-in-binary-tree

[https://leetcode.com/problems/linked-list-in-binary-tree/](https://leetcode.com/problems/linked-list-in-binary-tree/)

```
Given a binary tree root and a linked list with head as the first node.

Return True if all the elements in the linked list starting from the head correspond to some downward path connected in the binary tree otherwise return False.

In this context downward path means a path that starts at some node and goes downwards.



Example 1:

```
![https://assets.leetcode.com/uploads/2020/02/12/sample_1_1720.png](https://assets.leetcode.com/uploads/2020/02/12/sample_1_1720.png)
```

Input: head = [4,2,8], root = [1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]
Output: true
Explanation: Nodes in blue form a subpath in the binary Tree.
Example 2:

```
![https://assets.leetcode.com/uploads/2020/02/12/sample_2_1720.png](https://assets.leetcode.com/uploads/2020/02/12/sample_2_1720.png)
```

Input: head = [1,4,2,6], root = [1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]
Output: true
Example 3:

Input: head = [1,4,2,6,8], root = [1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]
Output: false
Explanation: There is no path in the binary tree that contains all the elements of the linked list from head.


Constraints:

1 <= node.val <= 100 for each node in the linked list and binary tree.
The given linked list will contain between 1 and 100 nodes.
The given binary tree will contain between 1 and 2500 nodes.
```

# thinking

直接来个 **preorder**，然后如果一致的话进入path判断即可了，注意左右子树都有可能成链.

# solution

```c++
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
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
    void pass(TreeNode* root, ListNode* node, bool& res) {
        if (!node) {
            res = true;
            return;
        }
        if (!root || res) return;

        if (root->val != node->val) return;

        pass(root->left, node->next, res);
        pass(root->right, node->next, res);
    }

    void preorder(TreeNode* root, bool& res) {
        if (!root || res) return;
        if (root->val == this->big_head->val) {
            ListNode* node = this->big_head;
            pass(root, node, res);
        }
        preorder(root->left, res);
        preorder(root->right, res);
    }

    bool isSubPath(ListNode* head, TreeNode* root) {
        this->big_head = head;
        bool res = false;
        preorder(root, res);

        return res;
    }
private:
    ListNode* big_head;
};
//Runtime: 40 ms, faster than 57.06% of C++ online submissions for Linked List in Binary Tree.
//Memory Usage: 23.9 MB, less than 100.00% of C++ online submissions for Linked List in Binary Tree.
```
