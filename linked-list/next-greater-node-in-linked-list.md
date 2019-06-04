# next-greater-node-in-linked-list

[https://leetcode.com/problems/next-greater-node-in-linked-list/](https://leetcode.com/problems/next-greater-node-in-linked-list/)

```
We are given a linked list with head as the first node.  Let's number the nodes in the list: node_1, node_2, node_3, ... etc.

Each node may have a next larger value: for node_i, next_larger(node_i) is the node_j.val such that j > i, node_j.val > node_i.val, and j is the smallest possible choice.  If such a j does not exist, the next larger value is 0.

Return an array of integers answer, where answer[i] = next_larger(node_{i+1}).

Note that in the example inputs (not outputs) below, arrays such as [2,1,5] represent the serialization of a linked list with a head node value of 2, second node value of 1, and third node value of 5.

 

Example 1:

Input: [2,1,5]
Output: [5,5,0]
Example 2:

Input: [2,7,4,3,5]
Output: [7,0,5,5,0]
Example 3:

Input: [1,7,5,1,9,2,5,1]
Output: [7,9,9,9,0,5,0,0]
 

Note:

1 <= node.val <= 10^9 for each node in the linked list.
The given list has length in the range [0, 10000].
```

# thinking

最开始理解错了，我以为是要求链表右侧的最大值呢，所以当遇到 **[1,7,5,1,9,2,5,1]** 这个case的时候就有问题了。实际上是找到链表右侧第一个大于当前值的最大值。

# solution (stack)

首先将链表处理到数组中，然后再使用stack存储数组的下标，挨个比较就好了。

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
    vector<int> nextLargerNodes(ListNode* head) {
        if (!head) return {};
        
        vector<int> v;
        while (head) {
            v.push_back(head->val);
            head = head->next;
        }
    
        int l = v.size();
        vector<int> res(l, 0);
        stack<int> s;
        for (int i=0;i<l;i++) {
            while (!s.empty() && v[i] > v[s.top()]) {
                res[s.top()] = v[i];
                s.pop();
            }
            s.push(i);
        }
        
        return res;
    }
};
//Runtime: 212 ms, faster than 92.23% of C++ online submissions for Next Greater Node In Linked List.
//Memory Usage: 26.6 MB, less than 26.46% of C++ online submissions for Next Greater Node In Linked List.
```