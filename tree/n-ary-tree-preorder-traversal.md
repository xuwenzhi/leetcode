# n-ary-tree-preorder-traversal

[https://leetcode.com/problems/n-ary-tree-preorder-traversal/](https://leetcode.com/problems/n-ary-tree-preorder-traversal/)

Given an n-ary tree, return the preorder traversal of its nodes' values.

For example, given a 3-ary tree:

![https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png](https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png)

Return its preorder traversal as: [1,3,5,6,2,4].



Note:

Recursive solution is trivial, could you do it iteratively?

# thinking

把遍历二叉树的形式改成遍历子节点就好了。

# solution

```
/*
// Definition for a Node.
class Node {
public:
    int val;
    vector<Node*> children;

    Node() {}

    Node(int _val, vector<Node*> _children) {
        val = _val;
        children = _children;
    }
};
*/
class Solution {
public:
    vector<int> preorder(Node* root) {
        vector<int> vec{};
        if (!root) return vec;

        helper(root, vec);
        return vec;
    }

    void helper(Node* node, vector<int> &sequence) {
        if (!node) return;
        sequence.push_back(node->val);
        for (int i = 0; i < node->children.size(); i++) {
            helper(node->children[i], sequence);
        }
    }
};
```

Runtime: 156 ms, faster than 99.14% of C++ online submissions for N-ary Tree Preorder Traversal.

Memory Usage: 32.2 MB, less than 100.00% of C++ online submissions for N-ary Tree Preorder Traversal.
