# intersection-of-two-linked-lists

[https://leetcode.com/problems/intersection-of-two-linked-lists/](https://leetcode.com/problems/intersection-of-two-linked-lists/)

Write a program to find the node at which the intersection of two singly linked lists begins.

For example, the following two linked lists:
![https://assets.leetcode.com/uploads/2018/12/13/160_statement.png](https://assets.leetcode.com/uploads/2018/12/13/160_statement.png)

begin to intersect at node c1.

Example 1:

![https://assets.leetcode.com/uploads/2018/12/13/160_example_1.png](https://assets.leetcode.com/uploads/2018/12/13/160_example_1.png)

Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
Output: Reference of the node with value = 8
Input Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,0,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.


Example 2:
![https://assets.leetcode.com/uploads/2018/12/13/160_example_2.png](https://assets.leetcode.com/uploads/2018/12/13/160_example_2.png)

Input: intersectVal = 2, listA = [0,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
Output: Reference of the node with value = 2
Input Explanation: The intersected node's value is 2 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [0,9,1,2,4]. From the head of B, it reads as [3,2,4]. There are 3 nodes before the intersected node in A; There are 1 node before the intersected node in B.


Example 3:

![https://assets.leetcode.com/uploads/2018/12/13/160_example_3.png](https://assets.leetcode.com/uploads/2018/12/13/160_example_3.png)

Input: intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
Output: null
Input Explanation: From the head of A, it reads as [2,6,4]. From the head of B, it reads as [1,5]. Since the two lists do not intersect, intersectVal must be 0, while skipA and skipB can be arbitrary values.
Explanation: The two lists do not intersect, so return null.


Notes:

If the two linked lists have no intersection at all, return null.
The linked lists must retain their original structure after the function returns.
You may assume there are no cycles anywhere in the entire linked structure.
Your code should preferably run in O(n) time and use only O(1) memory.

# solution1

最开始的想法是遍历A链表，然后把节点存放到map里，然后再遍历B，判断map中是否存在，不过效率会相对低一些，尤其是map.insert()的时候

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
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        std::unordered_map<ListNode*,int> map;
        ListNode *p = headA;
        while (p != NULL) {
            map.insert(std::make_pair(p, p->val));
            p = p->next;
        }

        ListNode *q = headB;
        while (q != NULL) {
            if (map.find(q) != map.end()) {
                return q;
            }
            q = q->next;
        }

        return NULL;
    }
};
```

Runtime: 64 ms

Memory Usage: 20.3 MB


# solution2

首先拿到两个链表的长度lenA,lenB，加入lenA > lenB，则pA指针移动到headA的(lenA - lenB)处，如果存在intersection则必然在pA和pB的后面，此时pA和pB同时向后移动，则能够拿到结果.

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
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        int len_a=0, len_b = 0;
        ListNode *p = headA, *q = headB;
        while (p != NULL) {
            len_a++;
            p = p->next;
        }
        while (q != NULL) {
            len_b++;
            q = q->next;
        }
        int  i = 0;
        p = headA;
        q = headB;
        if (len_a > len_b) {
            while (i<len_a - len_b) {
                p = p->next;
                i++;
            }
        } else {
            while (i < len_b - len_a) {
                q = q->next;
                i++;
            }
        }
        if (p == q) {
            return p;
        }
        while (p != q && q != NULL && p != NULL) {
            p = p->next;
            q = q->next;
            if (p == q) {
                return p;
            }
        }
        return NULL;
    }
};
```

Success

Details

Runtime: 52 ms, faster than 97.88% of C++ online submissions for Intersection of Two Linked Lists.

Memory Usage: 16.9 MB, less than 20.64% of C++ online submissions for Intersection of Two Linked Lists.
