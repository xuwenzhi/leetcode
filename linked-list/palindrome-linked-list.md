# palindrome-linked-list

[https://leetcode.com/problems/palindrome-linked-list/](https://leetcode.com/problems/palindrome-linked-list/)

# thinking

1. 最开始是希望使用另一个数据结构来存储前一半的数据，然后再比较回文，不过也是需要知道中间点

2. 所以后来考虑使用两个指针,slow和fast,fast到终点时，slow到达一半，而slow的工作不止是为了知道到达终点，还会对整个前一半链进行处理，做逆序，所以后面只需要顺序比较两个链表是否一致即可.

![https://github.com/xuwenzhi/leetcode/raw/master/images/palindrome.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/palindrome.jpg)


# solution

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
bool isPalindrome(struct ListNode* head) {
    if (!head) return true;
    struct ListNode *slow, *fast = head;
    struct ListNode *p;
    struct ListNode *dummy = (struct ListNode*)malloc(sizeof(struct ListNode));
    dummy->next = NULL;
    slow = fast = head;
    while (fast->next != NULL) {
        fast = fast->next->next;
        p = slow->next;
        slow->next = dummy->next;
        dummy->next = slow;
        slow = p;
        if (!fast) {
            break;
        }
    }
    // 奇数位，slow 后移一位
    if (fast) {
        slow = slow->next;
    }
    fast = slow;
    slow = dummy->next;
    while (fast && slow) {
        if (slow->val != fast->val) {
            return false;
        }
        fast = fast->next;
        slow = slow->next;
    }

    return true;
}
```
