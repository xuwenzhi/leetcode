# remove-linked-list-elements (easy)

# thinking

1. 就是遇到就过去就完了.


```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* removeElements(struct ListNode* head, int val) {
    if (!head) return NULL;
    struct ListNode *dummy = (struct ListNode*)malloc(sizeof(struct ListNode));
    struct ListNode *p = head, *prev = dummy;

    while (p) {
        while (p && p->val == val) {
            p = p->next;
        }
        prev->next = p;
        if (!p) {
            break;
        }
        p = p->next;
        prev = prev->next;
    }

    return dummy->next;
}
```
