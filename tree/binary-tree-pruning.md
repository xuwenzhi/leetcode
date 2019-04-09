# binary-tree-pruning

[https://leetcode.com/problems/binary-tree-pruning/](https://leetcode.com/problems/binary-tree-pruning/)


We are given the head node root of a binary tree, where additionally every node's value is either a 0 or a 1.

Return the same tree where every subtree (of the given tree) not containing a 1 has been removed.

(Recall that the subtree of a node X is X, plus every node that is a descendant of X.)

Example 1:
Input: [1,null,0,0,1]
Output: [1,null,0,null,1]

![https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/06/1028_2.png](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/06/1028_2.png)

Explanation:
Only the red nodes satisfy the property "every subtree not containing a 1".
The diagram on the right represents the answer.


Example 2:
Input: [1,0,1,0,0,0,1]
Output: [1,null,1,null,1]
![https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/06/1028_1.png](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/06/1028_1.png)


Example 3:
Input: [1,1,0,1,1,0,1,0]
Output: [1,1,0,1,1,null,1]
![https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/05/1028.png](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/05/1028.png)

Note:

The binary tree will have at most 100 nodes.
The value of each node will only be 0 or 1.

# thinking

这个题的要求是把所有子节点都是**0**的子节点剪掉，所以这里使用递归所有节点判断是否所有节点均为**0**，并且如果剪掉了该子树，则这个子树也就不需要在进行操作了。不过还有个问题，就是需要记录节点的上一个节点，所以这里使用了个dummy来进行记录当前处理节点的父节点。

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
    TreeNode* pruneTree(TreeNode* root) {
        TreeNode* dummy = new TreeNode(-1);
        dummy->left = root;
        helper(root, dummy, true);
        return dummy->left;
    }

    void helper(TreeNode* &root, TreeNode* dummy, bool isLeft) {
        if (!root) return;
        if (isAllZero(root)) {
            if (isLeft) {dummy->left = nullptr; return;}
            else {dummy->right = nullptr; return;}
        }

        helper(root->left, root, true);
        helper(root->right, root, false);
    }

    int isAllZero(TreeNode* root) {
        if (!root) return 1;
        int res = root->val == 0 ? 1 : 0;
        return res * isAllZero(root->left) * isAllZero(root->right);
    }
};
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Binary Tree Pruning.

Memory Usage: 10 MB, less than 32.29% of C++ online submissions for Binary Tree Pruning.
