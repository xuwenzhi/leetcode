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
//Runtime: 56 ms, faster than 63.62% of C++ online submissions for Sort List.
//Memory Usage: 24.8 MB, less than 27.62% of C++ online submissions for Sort List.
```



```c++
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* merge(ListNode* left, ListNode* right) {
        ListNode *l = left, *r = right;
        ListNode* dummy = new ListNode(0);
        ListNode* p = dummy;
        while (l && r) {
            if (l->val <= r->val) {
                p->next = l;
                l = l->next;
            } else {
                p->next = r;
                r = r->next;
            }
            p = p->next;
        }
        if (l) {
            p->next = l;
        }
        if (r) {
            p->next = r;
        }
        
        return dummy->next;
    }
    
    ListNode* mergeSort(ListNode* head) {
        if (!head || !head->next) return head;
        ListNode *slow = head, *fast = head, *prev;
        while (fast && fast->next) {
            prev = slow;
            fast = fast->next->next;
            slow = slow->next;
        }
        prev->next = nullptr;
        
        ListNode* l = mergeSort(head);
        ListNode* r = mergeSort(slow);
        
        return merge(l, r);
    }
    
    ListNode* sortList(ListNode* head) {
        return mergeSort(head);
    }
};
//Runtime: 96 ms, faster than 53.35% of C++ online submissions for Sort List.
//Memory Usage: 48.8 MB, less than 10.10% of C++ online submissions for Sort List.
```