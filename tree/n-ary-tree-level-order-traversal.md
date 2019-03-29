# n-ary-tree-level-order-traversal

[https://leetcode.com/problems/n-ary-tree-level-order-traversal/](https://leetcode.com/problems/n-ary-tree-level-order-traversal/)

```
Given an n-ary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

For example, given a 3-ary tree:
![https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png](https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png)
We should return its level order traversal:

[
     [1],
     [3,2,4],
     [5,6]
]


Note:

The depth of the tree is at most 1000.
The total number of nodes is at most 5000.
```

# thinking

多个和二叉树的差别不大，就是把left和right改成遍历children而已。

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
    vector<vector<int>> levelOrder(Node* root) {
        vector<vector<int>> vec{};
        if (!root) return vec;
        int index = 0, qLen = 0;
        Node* tmp;
        vector<int> col;
        queue<Node*> q{{root}};
        while (!q.empty()) {
            col.clear();
            qLen = q.size();
            for (int i = 0; i < qLen; i++) {
                tmp = q.front();
                q.pop();
                col.push_back(tmp->val);

                for (int j = 0; j < tmp->children.size(); j++) {
                    q.push(tmp->children[j]);
                }
            }
            vec.push_back(col);
            index++;
        }

        return vec;
    }
};
```

Runtime: 156 ms, faster than 99.19% of C++ online submissions for N-ary Tree Level Order Traversal.

Memory Usage: 33.4 MB, less than 100.00% of C++ online submissions for N-ary Tree Level Order Traversal.
