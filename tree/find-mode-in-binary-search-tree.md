# find-mode-in-binary-search-tree - 找出二叉搜索树的众数

[https://leetcode.com/problems/find-mode-in-binary-search-tree/](https://leetcode.com/problems/find-mode-in-binary-search-tree/)

```
Given a binary search tree (BST) with duplicates, find all the mode(s) (the most frequently occurred element) in the given BST.

Assume a BST is defined as follows:

The left subtree of a node contains only nodes with keys less than or equal to the node's key.
The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
Both the left and right subtrees must also be binary search trees.


For example:
Given BST [1,null,2,2],

   1
    \
     2
    /
   2


return [2].

Note: If a tree has more than one mode, you can return them in any order.

Follow up: Could you do that without using any extra space? (Assume that the implicit stack space incurred due to recursion does not count).
```

# thinking

既然是查找二叉搜索树的众数，那么遍历一遍，记录所有数以及它们出现的次数即可了，统计次数这里可以使用map存储（key为数字，value为数字出现的次数），所以基本上采用何种遍历方案均可。

另外，如果采用中序遍历，那么其实也可以得到一个顺序的数组，然后挨个比较也可以，不过比较麻烦，还是推荐使用上面的方案.

# solution(recursive)

```c++
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    vector<int> findMode(TreeNode* root) {
        vector<int> vec{};
        unordered_map<long, int> m;
        int maxx = 0;
        helper(root, m, maxx);
        for (auto i : m) {
            if (i.second == maxx) {
                vec.push_back(i.first);
            }
        }
        return vec;
    }

    void helper(TreeNode* root, unordered_map<long, int> &m, int &maxx) {
        if (!root) return;
        helper(root->left, m, maxx);
        ++m[root->val];
        maxx = max(maxx, m[root->val]);
        helper(root->right, m, maxx);
    }
};
```

Runtime: 36 ms, faster than 52.43% of C++ online submissions for Find Mode in Binary Search Tree.

Memory Usage: 27.6 MB, less than 42.72% of C++ online submissions for Find Mode in Binary Search Tree.

# solution (iteratively)

```c++
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    vector<int> findMode(TreeNode* root) {
        vector<int> vec{};
        if (!root) return vec;
        unordered_map<long, int> m;
        stack<TreeNode*> s;
        int maxx = 0;
        TreeNode* p = root;
        while (p || !s.empty()) {
            while (p) {
                s.push(p);
                p = p->left;
            }
            p = s.top(); s.pop();
            ++m[p->val];
            maxx = max(maxx, m[p->val]);
            p = p->right;
        }

        for (auto i : m) {
            if (i.second == maxx) {
                vec.push_back(i.first);
            }
        }
        return vec;
    }
};
```

Runtime: 32 ms, faster than 67.59% of C++ online submissions for Find Mode in Binary Search Tree.

Memory Usage: 24.8 MB, less than 50.49% of C++ online submissions for Find Mode in Binary Search Tree.
