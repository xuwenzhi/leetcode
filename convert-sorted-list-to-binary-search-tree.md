# convert-sorted-list-to-binary-search-tree

[https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/](https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/)

Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example:

Given the sorted linked list: [-10,-3,0,5,9],

One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

```
      0
     / \
   -3   9
   /   /
 -10  5
 ```
 
 # thinking
 
Because of the linkedlist is sorted，so the tree' root is in the middle. We can use slower and faster pointer to fullfil the binary tree with recursive.


 # solution
 
 ```
 /**
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
 ```
 
