# linked-list-cycle-ii

[https://leetcode.com/problems/linked-list-cycle-ii/](https://leetcode.com/problems/linked-list-cycle-ii/)


# thinking

1. 最开始是希望两个指针，直至交汇，并且 **p != q && p->next == q->next** 这样用于终结循环

2. 不过实际运行过程当中竟然还会出现 **死循环**，所以就很low的搞出来了一个随机数.

```c
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode *detectCycle(struct ListNode *head) {
    if (head == NULL || head->next == NULL) return false;
    if (head->next == head) return head;
    struct ListNode *p, *q, *tail;
    p = head;
    q = head->next;
    tail = NULL;
    srand((unsigned)time(NULL));
    while (true) {
        int r = rand();
        if (q == NULL || q->next == NULL) {
            return NULL;
        }
        if (q->next == head) {
            return head;
        }
        if (p != q && p->next == q->next) {
            return p->next;
        }
        if (p == q || p == tail) {
            tail = p;
            p = head;
            continue;
        }
        p = p->next;
        if (r % 2 == 0) {
            q = q->next->next;
        } else {
            q = q->next;
        }
    }

    return NULL;
}
// Runtime: 244 ms, faster than 5.05% of C online submissions for Linked List Cycle II.
```

结果不言而喻了。

# reference

[https://leetcode.com/problems/linked-list-cycle-ii/discuss/44793/O(n)-solution-by-using-two-pointers-without-change-anything](https://leetcode.com/problems/linked-list-cycle-ii/discuss/44793/O(n)-solution-by-using-two-pointers-without-change-anything)

后来参考了一下这个，主要看一下这个图吧~

![https://ws4.sinaimg.cn/large/006tNbRwly1fys0mm3y1lj31bd0u01kx.jpg](https://ws4.sinaimg.cn/large/006tNbRwly1fys0mm3y1lj31bd0u01kx.jpg)
