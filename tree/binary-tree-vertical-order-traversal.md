# binary-tree-vertical-order-traversal

[https://leetcode.com/problems/binary-tree-vertical-order-traversal/](https://leetcode.com/problems/binary-tree-vertical-order-traversal/)

```
Given a binary tree, return the vertical order traversal of its nodes' values. (ie, from top to bottom, column by column).

If two nodes are in the same row and column, the order should be from left to right.

Examples 1:

Input: [3,9,20,null,null,15,7]

   3
  /\
 /  \
 9  20
    /\
   /  \
  15   7

Output:

[
  [9],
  [3,15],
  [20],
  [7]
]
Examples 2:

Input: [3,9,8,4,0,1,7]

     3
    /\
   /  \
   9   8
  /\  /\
 /  \/  \
 4  01   7

Output:

[
  [4],
  [9],
  [3,0,1],
  [8],
  [7]
]
Examples 3:

Input: [3,9,8,4,0,1,7,null,null,null,2,5] (0's right child is 2 and 1's left child is 5)

     3
    /\
   /  \
   9   8
  /\  /\
 /  \/  \
 4  01   7
    /\
   /  \
   5   2

Output:

[
  [4],
  [9,5],
  [3,0,1],
  [8,2],
  [7]
]
```

# thinking

最开始是想给每一个节点编个号，根节点是0，相应的左右节点分别是-1 和 1，这样就按照能得到vertical order。所以最开始就是用 **preorder**，然后把相应的 **order** 和 **value** 存储到 **map**，map直接按照 **order** 排序就完事了，但是这样出现个问题，就是我使用递归实现的会出现一条竖直线上的value顺序出问题，如下中的 2 和 8 就是个例子。

```
Input:
[3,9,8,4,0,1,7,null,null,null,2,5]
Output:
[[4],[9,5],[3,0,1],[2,8],[7]]
Expected:
[[4],[9,5],[3,0,1],[8,2],[7]]
```

所以还是要 **BFS** 处理为妙，直接用个 **queue** 处理好了.

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

    vector<vector<int>> verticalOrder(TreeNode* root) {
        if (!root) return {};
        queue<pair<int, TreeNode*>> q;

        map<int, vector<int>> m;
        q.push(make_pair(0, root));

        while (!q.empty()) {
            int qsize = q.size();
            for (int i=0;i<qsize;i++) {
                auto front = q.front();

                int level      = front.first;
                TreeNode* node = front.second;

                m[level].push_back(node->val);

                if (node->left)
                    q.push(make_pair(level-1, node->left));
                if (node->right)
                    q.push(make_pair(level+1, node->right));

                q.pop();
            }

        }
        vector<vector<int>> res(m.size());
        int index = 0;
        for (auto i:m) {
            res[index++] = i.second;
        }

        return res;
    }
};
//Runtime: 8 ms, faster than 44.71% of C++ online submissions for Binary Tree Vertical Order Traversal.
//Memory Usage: 9.9 MB, less than 94.44% of C++ online submissions for Binary Tree Vertical Order Traversal.
```
