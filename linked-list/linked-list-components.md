# linked-list-components

[https://leetcode.com/problems/linked-list-components/](https://leetcode.com/problems/linked-list-components/)

We are given head, the head node of a linked list containing unique integer values.

We are also given the list G, a subset of the values in the linked list.

Return the number of connected components in G, where two values are connected if they appear consecutively in the linked list.

Example 1:

Input:
head: 0->1->2->3
G = [0, 1, 3]
Output: 2
Explanation:
0 and 1 are connected, so [0, 1] and [3] are the two connected components.
Example 2:

Input:
head: 0->1->2->3->4
G = [0, 3, 1, 4]
Output: 2
Explanation:
0 and 1 are connected, 3 and 4 are connected, so [0, 1] and [3, 4] are the two connected components.
Note:

If N is the length of the linked list given by head, 1 <= N <= 10000.
The value of each node in the linked list will be in the range [0, N - 1].
1 <= G.length <= 10000.
G is a subset of all values in the linked list.


-

# thinking

这题吧，总体来讲有点让人难以理解。。虽然最后写出来了，不过这题的意义不是特别大，这次是使用C++实现的，用到了STL的一个hash表，不过也可以不用hash，用一个SET也是可以的。

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
    int numComponents(ListNode* head, vector<int>& G) {
        std::unordered_map<int, int> map;
        for (int i = 0; i < G.size(); i++) {
            map.insert(std::make_pair(G[i], G[i]));
        }

        int result = 0;
        while (head) {
            if (map.find(head->val) != map.end()
                && (head->next == NULL || map.find(head->next->val) == map.end())) {
                std::cout<<head->val<<endl;
                result ++;
            }
            head = head->next;
        }

        return result;
    }
};
```


-

Success

Details

Runtime: 56 ms, faster than 42.29% of C++ online submissions for Linked List Components.

Memory Usage: 15.4 MB, less than 37.31% of C++ online submissions for Linked List Components.
