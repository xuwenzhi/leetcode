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
