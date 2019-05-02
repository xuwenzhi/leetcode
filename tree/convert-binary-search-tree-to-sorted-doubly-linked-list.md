# convert-binary-search-tree-to-sorted-doubly-linked-list

[https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list/](https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list/)

```
Convert a BST to a sorted circular doubly-linked list in-place. Think of the left and right pointers as synonymous to the previous and next pointers in a doubly-linked list.

Let's take the following BST as an example, it may help you understand the problem better:
```
![https://assets.leetcode.com/uploads/2018/10/12/bstdlloriginalbst.png](https://assets.leetcode.com/uploads/2018/10/12/bstdlloriginalbst.png)
```
We want to transform this BST into a circular doubly linked list. Each node in a doubly linked list has a predecessor and successor. For a circular doubly linked list, the predecessor of the first element is the last element, and the successor of the last element is the first element.

The figure below shows the circular doubly linked list for the BST above. The "head" symbol means the node it points to is the smallest element of the linked list.
```

![https://assets.leetcode.com/uploads/2018/10/12/bstdllreturndll.png](https://assets.leetcode.com/uploads/2018/10/12/bstdllreturndll.png)

```
Specifically, we want to do the transformation in place. After the transformation, the left pointer of the tree node should point to its predecessor, and the right pointer should point to its successor. We should return the pointer to the first element of the linked list.

The figure below shows the transformed BST. The solid line indicates the successor relationship, while the dashed line means the predecessor relationship.
```
![https://assets.leetcode.com/uploads/2018/10/12/bstdllreturnbst.png](https://assets.leetcode.com/uploads/2018/10/12/bstdllreturnbst.png)

# solution

```c++
// O(n) Runtime, O(1) Space.
/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* left;
    Node* right;

    Node() {}

    Node(int _val, Node* _left, Node* _right) {
        val = _val;
        left = _left;
        right = _right;
    }
};
*/
class Solution {
public:
    Node* treeToDoublyList(Node* root) {
        if (!root) return nullptr;
        Node* dummy = new Node(-1);
        Node* pre   = dummy;
        treeToDouble(root, pre);

        pre->right = dummy->right;
        dummy->right->left = pre;

        return dummy->right;
    }

    void treeToDouble(Node* root, Node* &pre) {
        if (!root) return;

        treeToDouble(root->left, pre);

        Node* node = new Node(root->val);
        pre->right = node;
        node->left = pre;

        pre = pre->right;

        treeToDouble(root->right, pre);
    }
};
//Runtime: 76 ms, faster than 98.98% of C++ online submissions for Convert Binary Search Tree to Sorted Doubly Linked List.
//Memory Usage: 26.9 MB, less than 37.38% of C++ online submissions for Convert Binary Search Tree to Sorted Doubly Linked List.
```
