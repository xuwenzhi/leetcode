# split-linked-list-in-parts

[https://leetcode.com/problems/split-linked-list-in-parts/](https://leetcode.com/problems/split-linked-list-in-parts/)

Given a (singly) linked list with head node root, write a function to split the linked list into k consecutive linked list "parts".

The length of each part should be as equal as possible: no two parts should have a size differing by more than 1. This may lead to some parts being null.

The parts should be in order of occurrence in the input list, and parts occurring earlier should always have a size greater than or equal parts occurring later.

Return a List of ListNode's representing the linked list parts that are formed.

Examples 1->2->3->4, k = 5 // 5 equal parts [ [1], [2], [3], [4], null ]
Example 1:
Input: 
root = [1, 2, 3], k = 5
Output: [[1],[2],[3],[],[]]
Explanation:
The input and each element of the output are ListNodes, not arrays.
For example, the input root has root.val = 1, root.next.val = 2, \root.next.next.val = 3, and root.next.next.next = null.
The first element output[0] has output[0].val = 1, output[0].next = null.
The last element output[4] is null, but it's string representation as a ListNode is [].
Example 2:
Input: 
root = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], k = 3
Output: [[1, 2, 3, 4], [5, 6, 7], [8, 9, 10]]
Explanation:
The input has been split into consecutive parts with size difference at most 1, and earlier parts are a larger size than the later parts.
Note:

The length of root will be in the range [0, 1000].
Each value of a node in the input will be an integer in the range [0, 999].
k will be an integer in the range [1, 50].


# thinking

1. 计算份数以及余数

2. 然后安排就行了

3. 需要注意的就是每一行末尾都需要加个NULL

4. 不存在的行，也要直接赋值 NULL

# solution

有个比较wired的地方，就是 **struct ListNode *a[100];** 这一行必须要定义在全局的位置上，定义在函数内部leetcode会报错! 感觉像是 memset 的缘故。

```c
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
/**
 * Return an array of size *returnSize.
 * Note: The returned array must be malloced, assume caller calls free().
 */
struct ListNode *a[100]; // wired, why should define a outside the function?
struct ListNode** splitListToParts(struct ListNode* root, int k, int* returnSize) {
    int length = 0;
    struct ListNode *cur = NULL;
    
    cur = root;
    while (cur != NULL) {
        cur = cur->next;
        length++;
    }
    
    int part_count = length / k;
    int part_remain_count = length % k;
    int i = 0, j;
    
    memset(a, 0, 100 * sizeof(struct ListNode*));
    int cur_length = 0;
    while (k-- > 0) {
        cur = NULL;
        a[i] = root;
        cur_length = part_count + (part_remain_count && part_remain_count > i ? 1 : 0);
        for (j = 0; j < cur_length && root; j++) {
            cur = root;
            root = root->next;
        }
        if (cur) {
            cur->next = NULL;
        }
        i++;
        if (a[i] != NULL) {
            printf("a[%d]:%d\n", i, a[i]->val);
        }
    } 
    *returnSize = i;
    
    return a;
}
```


Success

Details 

Runtime: 8 ms, faster than 43.59% of C online submissions for Split Linked List in Parts.

Memory Usage: 7.7 MB, less than 50.00% of C online submissions for Split Linked List in Parts.
