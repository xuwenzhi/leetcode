# middle-of-the-linked-list (easy)


[https://leetcode.com/problems/middle-of-the-linked-list/](https://leetcode.com/problems/middle-of-the-linked-list/)

# thinking

1. 由于是Non-Empty所以不判断head是否为NULL了

2. 另外就是用两个指针，fast 是 slow 的二倍即可

# solution

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* middleNode(struct ListNode* head) {
    struct ListNode *slow, *fast;
    slow = fast = head;

    while (fast->next) {
        slow = slow->next;
        fast = fast->next->next;
        if (!fast) {
            break;
        }
    }

    return slow;
}
```
