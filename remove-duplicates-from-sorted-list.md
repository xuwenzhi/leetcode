# remove-duplicates-from-sorted-list

[https://leetcode.com/problems/remove-duplicates-from-sorted-list/](https://leetcode.com/problems/remove-duplicates-from-sorted-list/)

# thinking

1. loop the lists, and compare  current val and next val.
2. if equal, jump to next. otherwise, connect it.

# solution

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* deleteDuplicates(struct ListNode* head) {
    if (head == NULL) return head;
    struct ListNode *p = head, *cur = head;
    while (p != NULL) {
        if (p->next != NULL && p->val == p->next->val) {
            p = p -> next;
            continue;
        }
        p = p->next;
        cur->next = p;
        cur = cur->next;
    }
    return head;
}
```



# Nice solution

[https://leetcode.com/problems/remove-duplicates-from-sorted-list/discuss/28625/3-Line-JAVA-recursive-solution](https://leetcode.com/problems/remove-duplicates-from-sorted-list/discuss/28625/3-Line-JAVA-recursive-solution)
```
public ListNode deleteDuplicates(ListNode head) {
	if(head == null || head.next == null)return head;
	head.next = deleteDuplicates(head.next);
	return head.val == head.next.val ? head.next : head;
}
```
