# linked-list-random-node

[https://leetcode.com/problems/linked-list-random-node/](https://leetcode.com/problems/linked-list-random-node/)

```
Given a singly linked list, return a random node's value from the linked list. Each node must have the same probability of being chosen.

Follow up:
What if the linked list is extremely large and its length is unknown to you? Could you solve this efficiently without using extra space?

Example:

// Init a singly linked list [1,2,3].
ListNode head = new ListNode(1);
head.next = new ListNode(2);
head.next.next = new ListNode(3);
Solution solution = new Solution(head);

// getRandom() should return either 1, 2, or 3 randomly. Each element should have equal probability of returning.
solution.getRandom();
```

# solution 

为了加快查找速度，所以在construction的时候把链表中所有的值搞到vector中了，然后在取随机节点值的时候，生成 [0, vector.size()-1]这个区间的即可。

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
private:
    vector<int> v;
public:
    /** @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node. */
    Solution(ListNode* head) {
        while (head) {
            v.push_back(head->val);
            head = head->next;
        }
    }
    
    /** Returns a random node's value. */
    int getRandom() {
        return v[rand() % v.size()];
    }
};

/**
 * Your Solution object will be instantiated and called as such:
 * Solution* obj = new Solution(head);
 * int param_1 = obj->getRandom();
 */
//Runtime: 36 ms, faster than 92.35% of C++ online submissions for Linked List Random Node.
//Memory Usage: 16.7 MB, less than 5.21% of C++ online submissions for Linked List Random Node.
```

# solution (Reservoir Sampling)

这是计算机科学界的一种随机算法，详细了解[水塘抽样算法](https://www.cnblogs.com/krcys/p/9121487.html)

算法特性

- 高效，节省内存（当样本超大的情况下也不必把所有数据加载到内存中）

- 随机 [水塘抽样](https://zh.wikipedia.org/wiki/%E6%B0%B4%E5%A1%98%E6%8A%BD%E6%A8%A3)

> 我们先让返回值 res 等于 head 的节点值，然后让 cur 指向 head 的下一个节点，定义一个变量i，初始化为2，若 cur 不为空我们开始循环，我们在 [0, i - 1] 中取一个随机数，如果取出来0，那么我们更新 res 为当前的 cur 的节点值，然后此时i自增一，cur 指向其下一个位置，这里其实相当于我们维护了一个大小为1的水塘，然后我们随机数生成为0的话，我们交换水塘中的值和当前遍历到的值，这样可以保证每个数字的概率相等。

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
private:
    ListNode* head;
public:
    /** @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node. */
    Solution(ListNode* head) {
        this->head = head;
    }
    
    /** Returns a random node's value. */
    int getRandom() {
        int i=2, res = head->val;
        ListNode* cur = head->next;
        
        while (cur) {
            int j = rand() % i;
            if (j == 0) res = cur->val;
            i++;
            cur = cur->next;
        }
        
        return res;
    }
};

/**
 * Your Solution object will be instantiated and called as such:
 * Solution* obj = new Solution(head);
 * int param_1 = obj->getRandom();
 */
//Runtime: 36 ms, faster than 92.35% of C++ online submissions for Linked List Random Node.
//Memory Usage: 16.4 MB, less than 42.18% of C++ online submissions for Linked List Random Node.
```

# refer

[水塘抽样算法](https://www.cnblogs.com/krcys/p/9121487.html)

[[LeetCode] Linked List Random Node 链表随机节点](https://www.cnblogs.com/grandyang/p/5759926.html)