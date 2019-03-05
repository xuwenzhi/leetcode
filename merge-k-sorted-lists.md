# merge-k-sorted-lists

[https://leetcode.com/problems/merge-k-sorted-lists/](https://leetcode.com/problems/merge-k-sorted-lists/)

# 最开始的思路

最开始是希望先组合出一列，然后在这一列中寻求最小值，拼接到返回值。然后再取一列，以此类推，不过复杂度可想而知了。


![https://github.com/xuwenzhi/leetcode/raw/master/images/merge-k-sorted-lists-think1.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/merge-k-sorted-lists-think1.jpg)

# 好吧

这个东西还真是难到了，只能借鉴一下经验，还是完成了

[https://www.youtube.com/watch?v=5xT5GMTFvRI](https://www.youtube.com/watch?v=5xT5GMTFvRI)

```c
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
 // 解决2个链表的问题
struct ListNode* merge(struct ListNode *l1, struct ListNode *l2) {
    if (l1 == NULL) {
        return l2;
    }
    if (l2 == NULL) {
        return l1;
    }
    if (l1->val < l2->val) {
        l1->next = merge(l1->next, l2);
        return l1;
    }
    l2->next = merge(l2->next, l1);
    return l2;
}


struct ListNode* sortList(struct ListNode** lists, int low, int high) {
    if (low >= high) {
        return lists[low];
    }

    int min = (high - low) / 2 + low;
    struct ListNode* l1 = sortList(lists, low, min);
    struct ListNode* l2 = sortList(lists, min + 1, high);

	// 最终为合并2个链表的问题
    return merge(l1, l2);
}

struct ListNode* mergeKLists(struct ListNode** lists, int listsSize) {
    if (lists == NULL || listsSize == 0) {
        return NULL;
    }
    return sortList(lists, 0, listsSize - 1);
}
```
