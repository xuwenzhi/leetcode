# insertion-sort-list

[https://leetcode.com/problems/insertion-sort-list/](https://leetcode.com/problems/insertion-sort-list/)

# thinking

这个题有点类似于插入排序，不过这是个单向链表，所以每次找到一个节点后需要从头偏移，所以效率上肯定不会太高。

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* insertionSortList(struct ListNode* head) {
    if (!head || !head->next) return head;
    struct ListNode *dummy = (struct ListNode *)malloc(sizeof(struct ListNode));
    dummy->next = head;
    struct ListNode *cur, *p, *q = head;
    cur = head;
    while (cur != NULL) {
        q = cur->next;
        // 实际上这里是可以优化的，比如判断下一个值是否小于当前值，如果小于当前值p可回到起始点，否则p可以原地不动，继续下一次循环
        p = dummy;
        if (!q) break;
        while (p->next != q) {
            if (p->next->val > q->val) {
                break;
            }
            p = p->next;
        }
        if (p->next == q) {
            cur = cur->next;
            continue;
        }

        cur->next = q->next;
        q->next = p->next;
        p->next = q;
    }
    
    return dummy->next;
}
```
