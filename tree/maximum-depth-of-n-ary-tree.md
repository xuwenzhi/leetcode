# maximum-depth-of-n-ary-tree

[https://leetcode.com/problems/maximum-depth-of-n-ary-tree/](https://leetcode.com/problems/maximum-depth-of-n-ary-tree/)

```
Given a n-ary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

For example, given a 3-ary tree:

```
![https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png](https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png)
```
We should return its max depth, which is 3.

Note:

The depth of the tree is at most 1000.
The total number of nodes is at most 5000.
```


# thinking

还是按照树的层序遍历搞了.

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
    int maxDepth(Node* root) {
        if (!root) return 0;
        int depth = 0, qLen = 0;
        Node* tmp;
        vector<int> col;
        queue<Node*> q{{root}};
        while (!q.empty()) {
            qLen = q.size();
            for (int i = 0; i < qLen; i++) {
                tmp = q.front();
                q.pop();
                for (int j = 0; j < tmp->children.size();j++) {
                    q.push(tmp->children[j]);
                }
            }
            depth++;
        }

        return depth;
    }
};
```

Runtime: 148 ms, faster than 98.48% of C++ online submissions for Maximum Depth of N-ary Tree.

Memory Usage: 32.7 MB, less than 23.20% of C++ online submissions for Maximum Depth of N-ary Tree.
