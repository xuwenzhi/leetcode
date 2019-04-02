# add-two-numbers

[https://leetcode.com/problems/add-two-numbers/](https://leetcode.com/problems/add-two-numbers/)

# my solution

```c
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    struct ListNode *l3 = (struct ListNode *)malloc(sizeof(struct ListNode));
    l3->val = 0;
    l3->next = NULL;        
    struct ListNode *ll1 = l1, *ll2 = l2;
    struct ListNode *head = l3;
    int surplus = 0;
    int a = 0, b = 0;
    while (ll1 != NULL || ll2 != NULL || surplus) {
        a = ll1 != NULL ? ll1->val : 0;
        b = ll2 != NULL ? ll2->val : 0;
        struct ListNode *tmp = (struct ListNode *)malloc(sizeof(struct ListNode));        
        tmp->val = (a + b  + surplus) % 10;
        surplus = (a + b + surplus) / 10;
        tmp->next = NULL;
        head->next = tmp;
        head = head->next;
        if (ll1){
        ll1 = ll1->next != NULL ? ll1->next : NULL;
        }
        if (ll2){
        ll2 = ll2->next != NULL ? ll2->next : NULL;
        }
    }
    return l3->next;
}
```