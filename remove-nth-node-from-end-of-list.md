# remove-nth-node-from-end-of-list

[https://leetcode.com/problems/remove-nth-node-from-end-of-list/](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)

# thinking

1. 先把end指针移动到指定位置

2. 然后start和end一起移动就行了

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* removeNthFromEnd(struct ListNode* head, int n) {
    if (!head || n == 0) return head;
    struct ListNode *start, *end;
    int i = 0;
    start = end = head;
    while (i < n) {
        end = end->next;
        i++;
    }
    if (end == NULL) {
        return head->next;
    }
    while (end->next != NULL) {
        start = start->next;
        end   = end->next;
    }
    start->next = start->next->next;
    return head;
}
```
