# add-two-numbers-ii


[https://leetcode.com/problems/add-two-numbers-ii/](https://leetcode.com/problems/add-two-numbers-ii/)

# thinking

1. 首先得到长度以及两个链表所有元素

2. 遍历相加，创建新节点即可

```
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    int stack1[100], stack2[100];
    struct ListNode *p1, *p2;
    p1 = l1;
    p2 = l2;
    int len1 = 0, len2 = 0;
    int tmp_len1, tmp_len2 = 0;
    while (p1 != NULL) {
        len1++;
        p1 = p1->next;
    }
    while (p2 != NULL) {
        len2++;
        p2 = p2->next;
    }
    p1 = l1; p2 = l2;
    tmp_len1 = 0;
    tmp_len2 = 0;
    while (p1 != NULL) {
        stack1[tmp_len1++] = p1->val;
        p1 = p1->next;
    }
    while (p2 != NULL) {
        stack2[tmp_len2++] = p2->val;
        p2 = p2->next;
    }

    int over = 0;
    int sum = 0;
    struct ListNode *prev = (struct ListNode*)malloc(sizeof(struct ListNode));
    prev->next = NULL;

    while (len1 > 0 || len2 > 0 || over) {
        sum = over;
        if (len1 > 0) {
            sum += stack1[len1 - 1];
            len1--;
        }
        if (len2 > 0) {
            sum += stack2[len2-1];
            len2--;
        }
        over = 0;
        if (sum >= 10) {
            over = 1;
        }
        struct ListNode *node = (struct ListNode*)malloc(sizeof(struct ListNode));
        node->val = sum % 10;
        node->next = prev->next;
        prev->next = node;
    }

    return prev->next;
}
```

# 一个golang解决方案

```golang
func addTwoNumbers(l1 *ListNode, l2 *ListNode) *ListNode {
    var stack1, stack2 []int
    for l1 != nil {
        stack1 = append(stack1, l1.Val)
        l1 = l1.Next
    }
    for l2 != nil {
        stack2 = append(stack2, l2.Val)
        l2 = l2.Next
    }
    var head *ListNode
    var over int
    for len(stack1) > 0 || len(stack2) > 0 || over > 0 {
        sum := over
        if len(stack1) > 0 {
            sum += stack1[len(stack1)-1]
            stack1 = stack1[:len(stack1)-1]
        }
        if len(stack2) > 0 {
            sum += stack2[len(stack2)-1]
            stack2 = stack2[:len(stack2)-1]
        }
        temp := ListNode{sum % 10, nil}
        over = sum / 10
        temp.Next = head
        head = &temp
    }
    return head
}
```
