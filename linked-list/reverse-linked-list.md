# reverse-linked-list

[https://leetcode.com/problems/reverse-linked-list/](https://leetcode.com/problems/reverse-linked-list/)

# thinking

这个没啥说的，大学写链表已经能熟读达到背诵.

# solution

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* reverseList(struct ListNode* head) {
    if (head == NULL) return NULL;

    struct ListNode *p, *q = head;
    struct ListNode *new_head = (struct ListNode *) malloc (sizeof(struct ListNode));
    new_head->val = 0;
    new_head->next = NULL;

    p = head;
    while (p != NULL) {
        q = p->next;
        p->next = new_head->next;
        new_head->next = p;
        p = q;
    }

    return new_head->next;
}
```

```c++
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        if (head == nullptr) return nullptr;
        ListNode *curr = head;
        ListNode* dummy = new ListNode(0);
        dummy->next = nullptr;
        while (curr) {
            ListNode *next_node = curr->next;
            curr->next = dummy->next;
            dummy->next = curr;
            curr = next_node;
        }
        
        return dummy->next;
    }
};
//Runtime: 4 ms, faster than 97.16% of C++ online submissions for Reverse Linked List.
//Memory Usage: 8.2 MB, less than 77.99% of C++ online submissions for Reverse Linked List.
```