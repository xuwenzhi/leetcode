# odd-even-linked-list

[https://leetcode.com/problems/odd-even-linked-list/](https://leetcode.com/problems/odd-even-linked-list/)

# thinking

1. pass by every node step by step.

2. according node's order, link the node tail the odd and even linkedlist.

# solution

```
/**
 * Definition for singly-linked list.
 * odd-even-linked-list ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* oddEvenList(struct ListNode* head) {
    if (!head) return NULL;
    struct ListNode *odd, *even, *p = head;
    p = odd = head;
    struct ListNode *dummy_even = (struct ListNode*)malloc(sizeof(struct ListNode));   
    even = dummy_even;
    struct ListNode *dummy_odd = (struct ListNode*)malloc(sizeof(struct ListNode));
    odd = dummy_odd;

    int order = 1;
    while (p != NULL) {
        if (order % 2 == 0) {
            even->next = p;
            even = even->next;
        } else {
            odd->next = p;
            odd = odd->next;
        }
        p = p->next;
        order++;
    }
    odd->next = NULL;
    even->next = NULL;
    
    if (dummy_even != even) {
        even->next = NULL;
        odd->next = dummy_even->next;
    }
    
    return dummy_odd->next;
}
```
