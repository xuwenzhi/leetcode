# binary-search-tree-iterator

[https://leetcode.com/problems/binary-search-tree-iterator/](https://leetcode.com/problems/binary-search-tree-iterator/)

```
Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.

Calling next() will return the next smallest number in the BST.



Example:
![https://assets.leetcode.com/uploads/2018/12/25/bst-tree.png](https://assets.leetcode.com/uploads/2018/12/25/bst-tree.png)

BSTIterator iterator = new BSTIterator(root);
iterator.next();    // return 3
iterator.next();    // return 7
iterator.hasNext(); // return true
iterator.next();    // return 9
iterator.hasNext(); // return true
iterator.next();    // return 15
iterator.hasNext(); // return true
iterator.next();    // return 20
iterator.hasNext(); // return false


Note:

next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.
You may assume that next() call will always be valid, that is, there will be at least a next smallest number in the BST when next() is called.
```

# thinking

总体来讲，实现的方法就两个，而且都是和**next**有关，题目要求next为最小的数，实际上就是二叉搜索树的一个中序遍历。此解决是中序遍历二叉搜索树，然后保存在vector<int>数组中，然后再维护一个**index**即可了.

# solution

```
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class BSTIterator {
public:
    vector<int> vec;
    int index = -1;
    BSTIterator(TreeNode* root) {
        inorder(root);
    }

    void inorder(TreeNode* root) {
        if (!root) return;
        inorder(root->left);
        this->vec.push_back(root->val);
        inorder(root->right);
    }

    /** @return the next smallest number */
    int next() {
        if (this->hasNext()) {
            this->index++;
            int res = this->vec[this->index];
            return res;
        }
        return -1;
    }

    /** @return whether we have a next smallest number */
    bool hasNext() {
        bool res = (this->index + 1) < vec.size();
        return res;
    }
};

/**
 * Your BSTIterator object will be instantiated and called as such:
 * BSTIterator* obj = new BSTIterator(root);
 * int param_1 = obj->next();
 * bool param_2 = obj->hasNext();
 */
```

Runtime: 60 ms, faster than 98.72% of C++ online submissions for Binary Search Tree Iterator.

Memory Usage: 25.4 MB, less than 15.18% of C++ online submissions for Binary Search Tree Iterator.
