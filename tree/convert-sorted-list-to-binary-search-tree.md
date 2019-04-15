# convert-sorted-list-to-binary-search-tree

[https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/](https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/)

```
Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example:

Given the sorted linked list: [-10,-3,0,5,9],

One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

      0
     / \
   -3   9
   /   /
 -10  5
```

# thinking

移动到链表中间，然后依次再加入到树中。

# solution
```c
/**
// O(nlog(n)) Runtime, O(logn) Space.
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */
struct TreeNode* generate(struct ListNode* head, struct ListNode* tail) {
    if (head == tail) return NULL;
    struct ListNode *slow, *fast;
    slow = head;
    fast = head;

    while (fast != tail && fast->next != tail) {
        fast = fast->next->next;
        slow = slow->next;

    }
    struct TreeNode *newnode = (struct TreeNode*)malloc(sizeof(struct TreeNode));
    newnode->val = slow->val;
    newnode->left  = generate(head, slow);
    newnode->right = generate(slow->next, tail);

    return newnode;
}
struct TreeNode* sortedListToBST(struct ListNode* head) {
    if (!head) return NULL;
    return generate(head, NULL);
}
//Runtime: 36 ms, faster than 36.46% of C online submissions for Convert Sorted List to Binary Search Tree.
//Memory Usage: 24.7 MB, less than 80.00% of C online submissions for Convert Sorted List to Binary Search Tree.
```
