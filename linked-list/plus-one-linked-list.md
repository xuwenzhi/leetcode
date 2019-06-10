# plus-one-linked-list

[https://leetcode.com/problem/plus-one-linked-list/](https://leetcode.com/problem/plus-one-linked-list/)

```
Given a non-negative integer represented as non-empty a singly linked list of digits, plus one to the integer.

You may assume the integer do not contain any leading zero, except the number 0 itself.

The digits are stored such that the most significant digit is at the head of the list.

Example :

Input: [1,2,3]
Output: [1,2,4]

```

# solution 

先遍历一次，将节点全部压栈。然后在挨个pop，在用一个初始化为1的over，来进行是否超出10即可。

```c++
// O(n) Runtime, O(n) Space.
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
    ListNode* plusOne(ListNode* head) {
        if (!head) return head;
        ListNode* p=head;
        stack<ListNode*> s;
        while (p) {
            s.push(p);
            p = p->next;
        }
        
        ListNode* newhead = nullptr;
        ListNode* tmp;
        int over = 1;
        while (!s.empty() || over) {
            int sum = over;
            if (!s.empty()) {
                tmp = s.top();
                s.pop();
                sum += tmp->val;
                tmp->val = sum % 10;
                tmp->next = newhead;
                newhead = tmp;
            } else {
                if (sum) {
                    ListNode* node = new ListNode(sum % 10);
                    node->next = newhead;
                    newhead = node;
                }
            }
            over = sum/10;
        }
        
        return newhead;
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Plus One Linked List.
//Memory Usage: 8.7 MB, less than 5.19% of C++ online submissions for Plus One Linked List.
```