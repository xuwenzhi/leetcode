# partition-list

[https://leetcode.com/problems/partition-list/](https://leetcode.com/problems/partition-list/)

# thinking

1. 依次遍历

2. 比较 **x** ，小于的接左边，大于等于的接右边

3. 最后已合并即可

# solution

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* partition(struct ListNode* head, int x) {
    if (!head) return NULL;
    struct ListNode *dummy = (struct ListNode *)malloc(sizeof(struct ListNode));
    struct ListNode *dummy_large = (struct ListNode *)malloc(sizeof(struct ListNode));
    dummy_large->next = NULL;
    dummy->next = head;
    struct ListNode *prev, *p, *q;
    q = dummy_large;
    prev = dummy;
    p = head;
    int i = 0;
    while (p != NULL) {
        if (p->val < x) {
            prev->next = p;
            prev = prev->next;
        } else {
            q->next = p;
            q = q->next;
        }
        p = p->next;
    }
    q->next = NULL;

    prev->next = dummy_large->next;

    return dummy->next;
}
```
