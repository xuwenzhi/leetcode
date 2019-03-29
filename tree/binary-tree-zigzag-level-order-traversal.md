# binary-tree-zigzag-level-order-traversal

[https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/)

Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

For example:
Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
return its zigzag level order traversal as:

[
  [3],
  [20,9],
  [15,7]
]

# thinking

下面的解决方案并不是最优的，因为在偶数情况需要对每一排的数组做一次reverse，不过肯定还是有其他方案的，比如说网上有一种使用两个栈，第一个栈从左到右存储，第二个栈从右向左存储，然后挨个儿输出即可，参考[https://www.cnblogs.com/grandyang/p/4297009.html](https://www.cnblogs.com/grandyang/p/4297009.html)

# solution

```
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
    vector<vector<int>> zigzagLevelOrder(TreeNode* root) {
        vector<vector<int>> vec{};
        if (!root) return vec;
        int index = 0, qLen = 0;
        TreeNode* tmp;
        vector<int> col;
        queue<TreeNode*> q{{root}};
        while (!q.empty()) {
            col.clear();
            qLen = q.size();
            cout<<index<<endl;
            for (int i = 0; i < qLen; i++) {
                tmp = q.front();
                q.pop();
                col.push_back(tmp->val);
                if (tmp->right) q.push(tmp->right);
                if (tmp->left)  q.push(tmp->left);
            }
            if (index % 2 == 0) {
                reverse(std::begin(col), std::end(col));
            }
            vec.push_back(col);
            index++;
        }

        return vec;
    }
};
```

Runtime: 12 ms, faster than 44.38% of C++ online submissions for Binary Tree Zigzag Level Order Traversal.

Memory Usage: 13.4 MB, less than 86.91% of C++ online submissions for Binary Tree Zigzag Level Order Traversal.
