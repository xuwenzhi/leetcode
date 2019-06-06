# populating-next-right-pointers-in-each-node-ii

[https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/](https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/)

```
Given a binary tree

struct Node {
  int val;
  Node *left;
  Node *right;
  Node *next;
}
Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

Initially, all next pointers are set to NULL.

```
![https://assets.leetcode.com/uploads/2019/02/15/117_sample.png](https://assets.leetcode.com/uploads/2019/02/15/117_sample.png)
```
Example:

Input: {"$id":"1","left":{"$id":"2","left":{"$id":"3","left":null,"next":null,"right":null,"val":4},"next":null,"right":{"$id":"4","left":null,"next":null,"right":null,"val":5},"val":2},"next":null,"right":{"$id":"5","left":null,"next":null,"right":{"$id":"6","left":null,"next":null,"right":null,"val":7},"val":3},"val":1}

Output: {"$id":"1","left":{"$id":"2","left":{"$id":"3","left":null,"next":{"$id":"4","left":null,"next":{"$id":"5","left":null,"next":null,"right":null,"val":7},"right":null,"val":5},"right":null,"val":4},"next":{"$id":"6","left":null,"next":null,"right":{"$ref":"5"},"val":3},"right":{"$ref":"4"},"val":2},"next":null,"right":{"$ref":"6"},"val":1}

Explanation: Given the above binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B.
 

Note:

You may only use constant extra space.
Recursive approach is fine, implicit stack space does not count as extra space for this problem.
```

# solution (bfs)

来个bfs遍历，然后处理一下就好了。

```c++
/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* left;
    Node* right;
    Node* next;

    Node() {}

    Node(int _val, Node* _left, Node* _right, Node* _next) {
        val = _val;
        left = _left;
        right = _right;
        next = _next;
    }
};
*/
class Solution {
public:
    Node* connect(Node* root) {
        if (!root) return root;
        queue<Node*> q{{root}};
        while (!q.empty()) {
            int len = q.size();
            Node* dummy = nullptr;
            for (int i=0;i<len;i++) {
                Node* node = q.front();
                node->next = nullptr;
                if (i == 0) {
                    dummy = node;
                } else {
                    dummy->next = node;
                    dummy = dummy->next;
                }
                q.pop();
                if (node->left) q.push(node->left);
                if (node->right) q.push(node->right);
            }
        }
        
        return root;
    }
};
//Runtime: 408 ms, faster than 79.72% of C++ online submissions for Populating Next Right Pointers in Each Node II.
//Memory Usage: 67.1 MB, less than 18.42% of C++ online submissions for Populating Next Right Pointers in Each Node II.
```