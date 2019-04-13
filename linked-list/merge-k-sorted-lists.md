# merge-k-sorted-lists

[https://leetcode.com/problems/merge-k-sorted-lists/](https://leetcode.com/problems/merge-k-sorted-lists/)

# 最开始的思路

最开始是希望先组合出一列，然后在这一列中寻求最小值，拼接到返回值。然后再取一列，以此类推，不过复杂度可想而知了。


![https://github.com/xuwenzhi/leetcode/raw/master/images/merge-k-sorted-lists-think1.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/merge-k-sorted-lists-think1.jpg)

# 好吧

这个东西还真是难到了，只能借鉴一下经验，最后使用归并排序搞定。

由于采用归并，则每次进行排序的链表数量变化:

k -> k/2 -> k/4 ... 2 -> 1

而每次排序的链表长度变化:

n -> 2n -> 4n ... 2^logk * n

则，最终的时间复杂度为 O(nklog(k)) Runtime, O(1) Space. 因为没有申请多余的空间，注意下方 merge() 。

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


# 其他方案及复杂度分析

## brute force

暴力merge的办法就是一对一的排序，比如一个[l1, l2, l3, l4]，首先对l1 和 l2 排序(假如l1和l2的平均长度为n，则操作为 2n)，然后排序的结果和l3排序(此时操作为 3n)，再将结果和l4排序(此时操作为4n)。那么扩展到第 k 个链表，则时间复杂度为

<a href="https://www.codecogs.com/eqnedit.php?latex=2n&space;&plus;&space;3n&space;&plus;&space;4n&space;&plus;&space;...&space;kn&space;=&space;n(\frac{k(k&plus;1))}{2}&space;-&space;1)&space;=&space;O(nk^{2})" target="_blank"><img src="https://latex.codecogs.com/gif.latex?2n&space;&plus;&space;3n&space;&plus;&space;4n&space;&plus;&space;...&space;kn&space;=&space;n(\frac{k(k&plus;1))}{2}&space;-&space;1)&space;=&space;O(nk^{2})" title="2n + 3n + 4n + ... kn = n(\frac{k(k+1))}{2} - 1) = O(nk^{2})" /></a>

空间复杂度为 O(1)。


## priority queue

这里使用优先队列的思想来解决问题，底层采用min heap来存储，记住priority queue和min heap并不是一回事

> A priority queue is an abstract datatype. It is a shorthand way of describing a particular interface and behavior, and says nothing about the underlying implementation.

> A heap is a data structure. It is a name for a particular way of storing data that makes certain operations very efficient.

所以，priority queue是一种抽象数据类型，而min heap是具体的一种数据结构，可以使用min heap来实现 priority queue.

在c++中有一个具体的container实现了[priority queue](http://www.cplusplus.com/reference/queue/priority_queue/)，可以直接使用。同时也有一个方法用于操作heap [std::make_heap](http://www.cplusplus.com/reference/algorithm/make_heap/)。而priority_queue底层正是调用make_heap。

遍历一遍，然后存储到min heap需要花费 log(k), 然后在遍历一遍，需要 n * k，则Runtime O(nklog(k))，Space O(k)。

### solution (priority queue)
```c++
// O(nklog(k)) Runtime, O(k) Space
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
    // Notice compare definenation
    struct compare{
        bool operator() (const ListNode* l, const ListNode* r) const {
            return l->val > r->val;
        }
    };

    ListNode* mergeKLists(vector<ListNode*>& lists) {
        priority_queue<ListNode *, vector<ListNode *>, compare> q;
		// store a row per time.
        for (auto i : lists) {
            if (i) q.push(i);
        }

        ListNode *dummy = new ListNode(0), *pre;
        pre = dummy;
        while (!q.empty()) {
            pre->next = q.top();
            q.pop();
            pre = pre->next;
            if (pre->next) {
                q.push(pre->next);
            }
        }

        return dummy->next;
    }
};
//Runtime: 28 ms, faster than 93.37% of C++ online submissions for Merge k Sorted Lists.
//Memory Usage: 11.1 MB, less than 99.39% of C++ online submissions for Merge k Sorted Lists.
```
