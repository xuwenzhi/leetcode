# reverse-nodes-in-k-group

[https://leetcode.com/problems/reverse-nodes-in-k-group/](https://leetcode.com/problems/reverse-nodes-in-k-group/)

# thinking

这题相比 [swap-nodes-in-pairs](https://github.com/xuwenzhi/leetcode/blob/master/swap-nodes-in-pairs.md) 增加了点难度，不过还好，需要注意的就是如果不足 **k** 个链，就不操作就完了


```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* reverseKGroup(struct ListNode* head, int k) {
    if (!head || !head->next || k <= 1) return head;
    struct ListNode *p, *q, *prev;
    struct ListNode *dummy = (struct ListNode*) malloc(sizeof(struct ListNode));
    dummy->next = head;
    p = head;
    prev = dummy;
    bool insufficient = false;
    while (p && p->next) {
        insufficient = false;
        for (int i = 1; i < k; i++) {
            if (p->next == NULL) {
                insufficient = true;
                break;
            }
            p = p->next;
        }
        p = prev->next;
        if (insufficient) {
            break;
        }
        for (int i = 1; i < k; i++) {
            q = p->next;
            if (q == NULL) {
                return dummy->next;
                break;
            }
            p->next = q->next;
            q->next = prev->next;
            prev->next = q;
        }
        prev = p;
        p = p->next;
    }

    return dummy->next;
}
```


# solution 

```c++
// O(n) Runtime, O(1) Space.
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
    ListNode* reverseKGroup(ListNode* head, int k) {
        ListNode dummy;
        dummy.next = head;
        head = &dummy;
        while (head != nullptr) {
            head = reverseNextK(head, k);
        }
        
        return dummy.next;
    }
    
    // head -> n1 -> n2 -> ... -> nk
    
    // head -> nk -> ... -> n2 -> n1
    ListNode* reverseNextK(ListNode* head, int k) {
        ListNode* n1 = head->next;
        ListNode* nk = head;
        for (int i = 0; i < k; i++) {
            nk = nk->next;
            if (nk == nullptr) {
                return nullptr;
            }
        }
        
        ListNode* nkplus = nk->next;
        ListNode* curr = head->next;
        ListNode* prev = head;
        while (curr != nkplus) {
            ListNode* tmp = curr->next;
            curr->next = prev;
            prev = curr;
            curr = tmp;
        }
        
        head->next = nk;
        n1->next = nkplus;
        
        return n1;
    }
};
//Runtime: 16 ms, faster than 60.29% of C++ online submissions for Reverse Nodes in k-Group.
//Memory Usage: 11.4 MB, less than 66.46% of C++ online submissions for Reverse Nodes in k-Group.
```
