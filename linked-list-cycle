# linked-list-cycle

[https://leetcode.com/problems/linked-list-cycle/](https://leetcode.com/problems/linked-list-cycle/)

# thinking


# solution

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
bool hasCycle(struct ListNode *head) {
    if (head == NULL || head->next == NULL) return false;
    struct ListNode *p, *q;
    p = head;
    q = head->next;
    while (p != q) {
        if (q == NULL || q->next == NULL) {
            return false;            
        }
        p = p->next;
        q = q->next->next;
        if (p == q) {
            return true;
        }
    }
    return p == q;
}
```
