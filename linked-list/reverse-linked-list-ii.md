# reverse-linked-list-ii

[https://leetcode.com/problems/reverse-linked-list-ii/](https://leetcode.com/problems/reverse-linked-list-ii/)

# thinking

这个题的思路和 [reverse-linked-list](https://github.com/xuwenzhi/leetcode/blo\
b/master/reverse-linked-list.md) 其实就差不多了，只不过增加了两边的边界，直接上代码吧

如果将来的某一天看不懂了，具体思路可以看 [Talk is cheap, show me the code (and DRAWING)](https://leetcode.com/problems/reverse-linked-list-ii/discuss/30709/Talk-is-cheap-show-me-the-code-(and-DRAWING))


```c
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* reverseBetween(struct ListNode* head, int m, int n) {
    if (head == NULL || m == n) return head;
    int loop = 1;
    struct ListNode *p, *q;
    p = head;
    struct ListNode *start = (struct ListNode*) malloc(sizeof(struct ListNode));
    start->next = head;
    while (p != NULL) {
        loop ++;
        if (loop <= m) {
            start = start->next;
            p = p->next;
            continue;
        }

        if (loop > n) {
            break;
        }

        q = p->next;
        p->next = q->next;
        q->next = start->next;
        start->next = q;
    }

    if (m == 1) {
        return start->next;
    }

    return head;
}
```
