# insert-into-a-cyclic-sorted-list

[https://leetcode.com/problems/insert-into-a-cyclic-sorted-list/](https://leetcode.com/problems/insert-into-a-cyclic-sorted-list/)

```
Given a node from a cyclic linked list which is sorted in ascending order, write a function to insert a value into the list such that it remains a cyclic sorted list. The given node can be a reference to any single node in the list, and may not be necessarily the smallest value in the cyclic list.

If there are multiple suitable places for insertion, you may choose any place to insert the new value. After the insertion, the cyclic list should remain sorted.

If the list is empty (i.e., given node is null), you should create a new single cyclic list and return the reference to that single node. Otherwise, you should return the original given node.

The following example may help you understand the problem better:

```
![https://assets.leetcode.com/uploads/2019/01/19/example_1_before_65p.jpg](https://assets.leetcode.com/uploads/2019/01/19/example_1_before_65p.jpg)
```
In the figure above, there is a cyclic sorted list of three elements. You are given a reference to the node with value 3, and we need to insert 2 into the list.
```
![https://assets.leetcode.com/uploads/2019/01/19/example_1_after_65p.jpg](https://assets.leetcode.com/uploads/2019/01/19/example_1_after_65p.jpg)
```

The new node should insert between node 1 and node 3. After the insertion, the list should look like this, and we should still return node 3.
```

# solution 

```c++
/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* next;

    Node() {}

    Node(int _val, Node* _next) {
        val = _val;
        next = _next;
    }
};
*/
class Solution {
public:
    Node* insert(Node* head, int insertVal) {
        if (!head) {
            Node* node = new Node(insertVal);
            node->next = node;
            return node;
        } else if (head->next == head) {
            Node* node = new Node(insertVal);
            node->next = head;
            head->next = node;
            return head;
        } else {
            Node* insertNode;
            Node* p = head;
            bool isCircled = false;
            while (true) {
                if (insertVal >= p->val && insertVal <= p->next->val) {
                    insertNode = p;
                    break;
                }
                if (p->next->val >= insertVal && p->val > p->next->val) {
                    insertNode = p;
                    break;
                }
                if (p->val <= insertVal && p->val > p->next->val) {
                    insertNode = p;
                    break;
                }
                // 如果转了一圈发现都没有找到插入点，则直接将末尾节点置为插入节点，这种情况是链表中所有元素都相同
                if (p->next == head) {
                    insertNode = p;
                    break;
                }
                p = p->next;
            }
            
            Node *n = new Node(insertVal);
            n->next = insertNode->next;
            insertNode->next = n;
        }
        
        return head;
    }
};
//Runtime: 96 ms, faster than 88.56% of C++ online submissions for Insert into a Cyclic Sorted List.
//Memory Usage: 29.5 MB, less than 50.26% of C++ online submissions for Insert into a Cyclic Sorted List.
```