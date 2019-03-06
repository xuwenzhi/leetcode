# rotate-list

# date

2019.3.6

[https://leetcode.com/problems/rotate-list/](https://leetcode.com/problems/rotate-list/)

# Thinking

1. 由于 k 的大小是整数，并且可能不会在 0-n 之间，所以可以考虑 k % n 的情况
2. 第一次遍历拿到具体的偏移位置
3. 第二次遍历偏移到具体位置，然后处理链接节点即可.

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* rotateRight(struct ListNode* head, int k) {
    if (head == NULL) return NULL;
    struct ListNode *p = head, *tp = head, *res;
    int i = 0, length = 1;
    // 首先计算length的大小
    while (p->next != NULL) {
        if (i >= k) {
            tp = tp->next;
        }
        p = p->next;
        length++;
        i++;
    }
    // 计算实际要往右偏移的数量
    k = length - k % length - 1;
    i = 0;
    tp = head;

    // 进行偏移
    while (i < k) {
        tp = tp->next;
        i++;
    }

    // 连接上尾部与头部，并把偏移点指向NULL
    p->next = head;
    res = tp->next;
    tp->next = NULL;
    return res;
}
```
