# n-ary-tree-postorder-traversal

[https://leetcode.com/problems/n-ary-tree-postorder-traversal/](https://leetcode.com/problems/n-ary-tree-postorder-traversal/)

Given an n-ary tree, return the postorder traversal of its nodes' values.

For example, given a 3-ary tree:

![https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png](https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png)
Return its postorder traversal as: [5,6,3,2,4,1].

Note:
Recursive solution is trivial, could you do it iteratively?

# thinking

和[[easy]n-ary-tree-preorder-traversal](https://github.com/xuwenzhi/leetcode/blob/master/tree/n-ary-tree-preorder-traversal.md)实现方式一致，只是调换下代码位置即可。

# solution

```c++
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
    vector<int> postorder(Node* root) {
        vector<int> vec{};
        if (!root) return vec;

        helper(root, vec);
        return vec;
    }

    void helper(Node* node, vector<int> &sequence) {
        if (!node) return;
        for (int i = 0; i < node->children.size(); i++) {
            helper(node->children[i], sequence);
        }
        sequence.push_back(node->val);
    }
};
```

Runtime: 160 ms, faster than 84.02% of C++ online submissions for N-ary Tree Postorder Traversal.

Memory Usage: 32.5 MB, less than 100.00% of C++ online submissions for N-ary Tree Postorder Traversal.
