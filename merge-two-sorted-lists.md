# merge-two-sorted-lists

[https://leetcode.com/problems/merge-two-sorted-lists/](https://leetcode.com/problems/merge-two-sorted-lists/)

# My Solution

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* mergeTwoLists(struct ListNode* l1, struct ListNode* l2) {
    struct ListNode *l3, *p3;
    struct ListNode *p1 = l1, *p2 = l2;
    if (p1 == NULL || p2 == NULL) {
        return p1 == NULL ? p2 : p1;
    }
    if (p1->val <= p2->val) {
        l3 = p1;
        p3 = p1;
        p1 = p1->next;
    } else {
        l3 = p2;
        p3 = p2;
        p2 = p2->next;
    }

    l3 = p3;
    int i = 0;
    while (p1 != NULL && p2 != NULL) {
        if (p1->val <= p2->val) {
            p3->next = p1;
            p1 = p1->next;
        } else {
            p3->next = p2;
            p2 = p2->next;
        }
        p3 = p3->next;
    }
    if (p1 != NULL) {
 		p3->next = p1;
    }
    if (p2 != NULL) {
        p3->next = p2;
    }
    return l3;
}
```


# Good C Solution

```
struct ListNode* mergeTwoLists(struct ListNode* l1, struct ListNode* l2) {
    if (l1 == NULL)
        return l2;
    if (l2 == NULL)
        return l1;
    if (l1->val <= l2->val) {
        l1->next = mergeTwoLists(l1->next, l2);
        return l1;
    } else {
        l2->next = mergeTwoLists(l1, l2->next);
        return l2;
    }
}
```

[https://leetcode.com/problems/merge-two-sorted-lists/discuss/10010/Recursive-C-solution-4ms](https://leetcode.com/problems/merge-two-sorted-lists/discuss/10010/Recursive-C-solution-4ms)

# Summary

1. Notice first element pointer.
2. Dont forget recursive！
