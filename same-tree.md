# same-tree

[https://leetcode.com/problems/same-tree/](https://leetcode.com/problems/same-tree/)


# thinking

既然只是为了判断是不是两颗一样的树，本身也不希望太麻烦，所以希望能够使用递归解决，只要遇到类型不符（比如其中一个为NULL），或者值不同时即可判断为false，造一个函数，返回boolean即可，如果same则返回 **tree** ,否则返回 **false**.


# solution

```c
int traceTree(struct TreeNode *p, struct TreeNode *q) {
    int res = 1;

    if (p == NULL && q == NULL) {
        return 1;
    }

    if (p == NULL ^ q == NULL) return 0;
    if (p != NULL && q != NULL && p->val != q->val) {
        return 0;
    }
    if ((p->left == NULL ^ q->left == NULL) || (p->right == NULL ^ q->right == NULL)) {
        res = 0;
    }
    if (p->left && q->left)
        res = res * traceTree(p->left, q->left);
    if (p->right && q->right)
        res = res * traceTree(p->right, q->right);

    return res;
}

/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */
bool isSameTree(struct TreeNode* p, struct TreeNode* q) {
    return traceTree(p, q);
}
```
