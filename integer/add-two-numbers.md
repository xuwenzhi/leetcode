# add-two-numbers

[https://leetcode.com/problems/add-two-numbers/](https://leetcode.com/problems/add-two-numbers/)

```
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
```

# thinking

这题不知道啥时候做的了，也忘了啥思路了。。

# solution

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    struct ListNode *l3 = (struct ListNode *)malloc(sizeof(struct ListNode));
    l3->val = 0;
    l3->next = NULL;
    struct ListNode *ll1 = l1, *ll2 = l2;
    struct ListNode *head = l3;
    int surplus = 0;
    int a = 0, b = 0;
    while (ll1 != NULL || ll2 != NULL || surplus) {
        a = ll1 != NULL ? ll1->val : 0;
        b = ll2 != NULL ? ll2->val : 0;
        struct ListNode *tmp = (struct ListNode *)malloc(sizeof(struct ListNode));
        tmp->val = (a + b  + surplus) % 10;
        surplus = (a + b + surplus) / 10;
        tmp->next = NULL;
        head->next = tmp;
        head = head->next;
        if (ll1){
        ll1 = ll1->next != NULL ? ll1->next : NULL;
        }
        if (ll2){
        ll2 = ll2->next != NULL ? ll2->next : NULL;
        }
    }
    return l3->next;
}
```
Runtime: 32 ms

Memory Usage: N/A
