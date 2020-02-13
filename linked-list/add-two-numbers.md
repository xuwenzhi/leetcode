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

由于这道题是很久之前做的，所以有点忘记，一直以为这个是从后往前加的，今天又仔细看了下题目，原来是从左往右相加的，这就尴尬了，所以从新写一遍吧.

# solution (c N久前)

```c
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

# solution (c++)

```
// O(m+n) Runtime O(m+n) Space
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode* dummy = new ListNode(-1);
        ListNode *p = l1, *q = l2, *pre = dummy;
        int over = 0;
        while (p || q || over) {
            int sum = 0;
            sum += p ? p->val : 0;
            sum += q ? q->val : 0;
            sum += over;
            over = sum / 10;
            sum %= 10;

            ListNode *node = new ListNode(sum);
            pre->next = node;
            pre = pre->next;

            p = p ? p->next : nullptr;
            q = q ? q->next : nullptr;
        }

        return dummy->next;
    }
};

```


# solution (best)

```c++
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        int sum = 0;
        ListNode* l3 = new ListNode(0);
        ListNode* result = l3;
        while (l1 || l2 || sum) {
            if (l1) {
                sum += l1->val;
                l1 = l1->next;
            }
            if (l2) {
                sum += l2->val;
                l2 = l2->next;
            }
            l3->next = new ListNode(sum % 10);
            l3 = l3->next;
            sum /= 10;
        }
        return result->next;
    }
};
//Runtime: 20 ms, faster than 94.28% of C++ online submissions for Add Two Numbers.
//Memory Usage: 11.9 MB, less than 5.14% of C++ online submissions for Add Two Numbers.
```
