# construct-binary-search-tree-from-preorder-traversal

[https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/](https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/)

```
Return the root node of a binary search tree that matches the given preorder traversal.

(Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)

```
![https://assets.leetcode.com/uploads/2019/03/06/1266.png](https://assets.leetcode.com/uploads/2019/03/06/1266.png)
```

Example 1:

Input: [8,5,1,7,10,12]
Output: [8,5,10,1,7,null,12]

 

Note: 

1 <= preorder.length <= 100
The values of preorder are distinct.
```

# thinking

1. 由于是BST，并且是preorder，所以第一个大于当前根节点的数据是右子节点。

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
    TreeNode* constructTree(vector<int>::iterator begin, vector<int>::iterator end) {
        if (begin == end) return nullptr;
        auto pivot = upper_bound(begin, end, *begin);
        
        TreeNode* node = new TreeNode(*begin);
        node->left = constructTree(begin+1, pivot);
        node->right = constructTree(pivot, end);
        
        return node;
    }
    
    TreeNode* bstFromPreorder(vector<int>& preorder) {
        return constructTree(preorder.begin(), preorder.end());
    }
};
//Runtime: 4 ms, faster than 91.05% of C++ online submissions for Construct Binary Search Tree from Preorder Traversal.
//Memory Usage: 10.7 MB, less than 78.25% of C++ online submissions for Construct Binary Search Tree from Preorder Traversal.
```

# refer

[Less than 10 lines C++ beats 100](https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/discuss/324887/)