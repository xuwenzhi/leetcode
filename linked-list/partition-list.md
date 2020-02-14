# partition-list

[https://leetcode.com/problems/partition-list/](https://leetcode.com/problems/partition-list/)

# thinking

1. 依次遍历

2. 比较 **x** ，小于的接左边，大于等于的接右边

3. 最后已合并即可

# solution

```c
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* partition(struct ListNode* head, int x) {
    if (!head) return NULL;
    struct ListNode *dummy = (struct ListNode *)malloc(sizeof(struct ListNode));
    struct ListNode *dummy_large = (struct ListNode *)malloc(sizeof(struct ListNode));
    dummy_large->next = NULL;
    dummy->next = head;
    struct ListNode *prev, *p, *q;
    q = dummy_large;
    prev = dummy;
    p = head;
    int i = 0;
    while (p != NULL) {
        if (p->val < x) {
            prev->next = p;
            prev = prev->next;
        } else {
            q->next = p;
            q = q->next;
        }
        p = p->next;
    }
    q->next = NULL;
    prev->next = dummy_large->next;
    return dummy->next;
}
```

# solution (2020.2.13)

这个解决方案主要是创建了两个链表对象 **ListNode left(0), right(0);** ，还是第一次这么使用。然后判断 **x** 的大小拼接到 left 或者 right 右面即可.

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
    ListNode* partition(ListNode* head, int x) {
        ListNode left(0), right(0);
        ListNode *l = &left, *r = &right;

        while (head) {
            ListNode* &ref = (head->val < x) ? l : r;
            ref->next = head;
            ref = ref->next;
            head = head->next;
        }
        r->next = nullptr;
        l->next = right.next;

        return left.next;
    }
};
//Runtime: 8 ms, faster than 66.58% of C++ online submissions for Partition List.
//Memory Usage: 9 MB, less than 8.33% of C++ online submissions for Partition List.
```
