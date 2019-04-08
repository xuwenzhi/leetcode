# remove-duplicates-from-sorted-list-ii

[https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/](https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/)

# thinking

想了好久，没整出来，总是考虑不好 1->2->3->3->4->5->NULL 中3 -> 4 的这种情况，具体看代码吧~

另外，还需要考虑1->1->1->2->3->NULL 的这种情况，所以需要新设置一个头结点来处理.


```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* deleteDuplicates(struct ListNode* head) {
    if (head  == NULL) return head;
    struct ListNode *cur, *pre;
    struct ListNode *dummy = (struct ListNode *) malloc(sizeof(struct ListNode));
    cur = head;
    pre = dummy;
    dummy->next = head;
    int tmp;
    while (pre->next) {
        cur = pre->next;
        while (cur->next && cur->val == cur->next->val) {
            cur = cur->next;
        }
        if (cur != pre->next) {
            // cur 动了，那么把下一个不同的地址给pre->next
            pre->next = cur->next;
        } else {
            // cur 没动，所以cur不和下一个相同，那么当前的 cur 就是可取的
            pre = pre->next;
        }
    }

    return dummy->next;
}
```
