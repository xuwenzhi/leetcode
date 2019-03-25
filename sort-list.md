# sort-list

[https://leetcode.com/problems/sort-list/](https://leetcode.com/problems/sort-list/)

```
Sort a linked list in O(n log n) time using constant space complexity.

Example 1:

Input: 4->2->1->3
Output: 1->2->3->4
Example 2:

Input: -1->5->3->4->0
Output: -1->0->3->4->5
```

# thinking

 排序个链表，而且要使用O(n log n)，那么我这里选择的是Merge Sort,代码如下，另外也可以使用快排来实现。

# solution

```
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
    ListNode* sortList(ListNode* head) {
        if (!head) return nullptr;
        return sort(head);
    }

    ListNode* sort(ListNode* head) {
        if (head->next == nullptr) {
            return head;
        }

        ListNode *slow = head, *fast = head;
        ListNode *left, *right, *prev;
        while (fast != nullptr && fast->next != nullptr) {
            prev = slow;
            fast = fast->next->next;
            slow = slow->next;
        }
        prev->next = nullptr;
        left  = sort(head);
        right = sort(slow);

        return merge(left, right);
    }

    ListNode* merge(ListNode* left, ListNode* right) {
        ListNode* l = new ListNode(0);
        ListNode* p = l;
        while (left != nullptr && right != nullptr) {
            if (left->val <= right->val) {
                p->next = left;
                left = left->next;
            } else {
                p->next = right;
                right = right->next;
            }
            p = p->next;
        }
        if (left) {
            p->next = left;
        }
        if (right) {
            p->next = right;
        }
        p->next == nullptr;
        return l->next;
    }
};
```

Success

Details

Runtime: 56 ms, faster than 63.62% of C++ online submissions for Sort List.

Memory Usage: 24.8 MB, less than 27.62% of C++ online submissions for Sort List.
