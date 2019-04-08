# swap-nodes-in-pairs

[https://leetcode.com/problems/swap-nodes-in-pairs/](https://leetcode.com/problems/swap-nodes-in-pairs/)

# solution


```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* swapPairs(struct ListNode* head) {
    if (!head) return NULL;
    struct ListNode *p, *q, *prev;
    struct ListNode *dummy = (struct ListNode *) malloc (sizeof(struct ListNode));
    dummy->next = head;
    prev = dummy;
    p = head;

    while (p && p->next) {
        q = p->next;
        p->next = q->next;
        prev->next = q;
        q->next = p;

        prev = p;
        p = p->next;
    }

    return dummy->next;
}
```
