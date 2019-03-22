# copy-list-with-random-pointer

[https://leetcode.com/problems/copy-list-with-random-pointer/](https://leetcode.com/problems/copy-list-with-random-pointer/)

A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.

Return a deep copy of the list.

Example 1:

![https://discuss.leetcode.com/uploads/files/1470150906153-2yxeznm.png](https://discuss.leetcode.com/uploads/files/1470150906153-2yxeznm.png)

Input:
{"$id":"1","next":{"$id":"2","next":null,"random":{"$ref":"2"},"val":2},"random":{"$ref":"2"},"val":1}

Explanation:
Node 1's value is 1, both of its next and random pointer points to Node 2.
Node 2's value is 2, its next pointer points to null and its random pointer points to itself.


Note:

You must return the copy of the given head as a reference to the cloned list.

# thinking

1. 首先遍历一遍原始链表，并创建好新链表，同时copy **next pointer** 和 **random pointer**

2. 遍历一遍的情况下，还有一个步骤 **p->random = newnode;** ，因为题目没说不能修改原链表

3. 遍历一遍新链表，然后做 **prev->random = prev->random->random;** 操作就是精髓了

![https://github.com/xuwenzhi/leetcode/raw/master/images/copy-list-with-random-pointer.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/copy-list-with-random-pointer.jpg)

# solution

```
/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* next;
    Node* random;

    Node() {}

    Node(int _val, Node* _next, Node* _random) {
        val = _val;
        next = _next;
        random = _random;
    }
};
*/
class Solution {
public:
    Node* copyRandomList(Node* head) {
        if (!head) return NULL;
        Node* p = head;
        Node* dummy = new Node(0);
        dummy->next = head;
        Node* prev = dummy;

        while (p != nullptr) {
            Node* newnode = new Node(p->val);
            newnode->next = p->next;
            if (p->random == nullptr) {
                newnode->random = nullptr;
            } else {
                newnode->random = p->random;
            }
            prev->next = newnode;
            prev = prev->next;

            p->random = newnode;
            p = p->next;
        }
        prev->next = nullptr;

        prev = dummy->next;
        while (prev != nullptr) {
            if (prev->random) {
                prev->random = prev->random->random;
            }

            prev = prev->next;
        }

        return dummy->next;
    }
};
```


Success

Details

Runtime: 36 ms, faster than 99.96% of C++ online submissions for Copy List with Random Pointer.

Memory Usage: 21.9 MB, less than 5.21% of C++ online submissions for Copy List with Random Pointer.
