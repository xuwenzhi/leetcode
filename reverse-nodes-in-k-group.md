# reverse-nodes-in-k-group

[https://leetcode.com/problems/reverse-nodes-in-k-group/](https://leetcode.com/problems/reverse-nodes-in-k-group/)

# thinking

这题相比 [swap-nodes-in-pairs](https://github.com/xuwenzhi/leetcode/blob/master/swap-nodes-in-pairs.md) 增加了点难度，不过还好，需要注意的就是如果不足 **k** 个链，就不操作就完了


```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* reverseKGroup(struct ListNode* head, int k) {
    if (!head || !head->next || k <= 1) return head;
    struct ListNode *p, *q, *prev;
    struct ListNode *dummy = (struct ListNode*) malloc(sizeof(struct ListNode));
    dummy->next = head;
    p = head;
    prev = dummy;
    bool insufficient = false;
    while (p && p->next) {
        insufficient = false;
        for (int i = 1; i < k; i++) {
            if (p->next == NULL) {
                insufficient = true;
                break;
            }
            p = p->next;
        }
        p = prev->next;
        if (insufficient) {
            break;
        }
        for (int i = 1; i < k; i++) {
            q = p->next;
            if (q == NULL) {
                return dummy->next;
                break;
            }
            p->next = q->next;
            q->next = prev->next;
            prev->next = q;
        }
        prev = p;
        p = p->next;
    }

    return dummy->next;
}
```
