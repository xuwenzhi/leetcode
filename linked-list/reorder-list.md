# reorder-list

[https://leetcode.com/problems/reorder-list/](https://leetcode.com/problems/reorder-list/)


# brief

Given a singly linked list L: L0→L1→…→Ln-1→Ln,
reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…

You may not modify the values in the list's nodes, only nodes itself may be changed.

Example 1:

Given 1->2->3->4, reorder it to 1->4->2->3.
Example 2:

Given 1->2->3->4->5, reorder it to 1->5->2->4->3.

# thinking

1. slow fast 指针，然后倒置后一半链表

2. 然后遍历两个链表，后面的插入前一个

# solution

```c
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
void reorderList(struct ListNode* head) {
    if (!head) return NULL;
    struct ListNode *middle, *slow, *fast, *q;
    slow = fast = head;
    while (fast != NULL) {
        if (!fast->next) break;
        fast = fast->next->next;
        slow = slow->next;
    }
    middle = fast = slow;
    fast = middle->next;
    while (fast && fast->next) {
        q = fast->next;
        fast->next = q->next;
        q->next = middle->next;
        middle->next = q;
    }

    slow = head;
    while (middle->next) {
        if (slow == middle) break;
        q = middle->next;
        middle->next = q->next;
        q->next = slow->next;
        slow->next = q;
        slow = slow->next->next;
    }
}
```
##
Success
Details
Runtime: 20 ms, faster than 77.12% of C online submissions for Reorder List.
Memory Usage: 10.8 MB, less than 20.00% of C online submissions for Reorder List.
