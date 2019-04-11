# find-largest-value-in-each-tree-row

[https://leetcode.com/problems/find-largest-value-in-each-tree-row/](https://leetcode.com/problems/find-largest-value-in-each-tree-row/)

```
You need to find the largest value in each row of a binary tree.

Example:

Input: 

          1
         / \
        3   2
       / \   \  
      5   3   9 

Output: [1, 3, 9]
```


# thinking

这个题咋说呢，特别想踩一脚，啥啥的都不交代，比方说节点值的范围啊，最大深度啊之类之类的，本来就是一个Easy的题，不过非要搞成Medium，直接来个层序遍历就完事了。
# solution

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
    vector<int> largestValues(TreeNode* root) {
        vector<int> vec{};
        if (!root) return vec;
        int qLen = 0;
        TreeNode* tmp;
        queue<TreeNode*> q{{root}};
        while (!q.empty()) {
            int maxInteger = -1;
            qLen = q.size();
            for (int i = 0; i < qLen; i++) {
                tmp = q.front();
                q.pop();
                if (maxInteger == -1 || maxInteger < tmp->val) {
                    maxInteger = tmp->val;
                }
                if (tmp->left)  q.push(tmp->left);
                if (tmp->right) q.push(tmp->right);
            }

            vec.push_back(maxInteger);
        }

        return vec;
    }
};
```

Runtime: 24 ms, faster than 75.15% of C++ online submissions for Find Largest Value in Each Tree Row.

Memory Usage: 21 MB, less than 98.94% of C++ online submissions for Find Largest Value in Each Tree Row.
