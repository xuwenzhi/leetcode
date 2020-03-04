# maximum-level-sum-of-a-binary-tree

[https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/](https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/)

```
Given the root of a binary tree, the level of its root is 1, the level of its children is 2, and so on.

Return the smallest level X such that the sum of all the values of nodes at level X is maximal.



Example 1:

```
![https://assets.leetcode.com/uploads/2019/05/03/capture.JPG](https://assets.leetcode.com/uploads/2019/05/03/capture.JPG)
```

Input: [1,7,0,7,-8,null,null]
Output: 2
Explanation:
Level 1 sum = 1.
Level 2 sum = 7 + 0 = 7.
Level 3 sum = 7 + -8 = -1.
So we return the level with the maximum sum which is level 2.


Note:

The number of nodes in the given tree is between 1 and 10^4.
-10^5 <= node.val <= 10^5
```

# thinking

直接计算每个level的和，然后取level就好了，注意如果有相同的sum的level，要取小的那个，比如 level2和level3 的和都是7， 那么结果应该是 2

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
    int maxLevelSum(TreeNode* root) {
        queue<TreeNode*> q{{root}};
        int len = 0, sum = 0, max_level = INT_MIN, level = 1, res = 1;
        while (!q.empty()) {
            len = q.size();
            sum = 0;
            for (int i=0;i<len;i++) {
                auto node = q.front();
                sum += node->val;
                q.pop();
                if (node->left) {
                    q.push(node->left);
                }
                if (node->right) {
                    q.push(node->right);
                }
            }
            if (max_level < sum) {
                max_level = sum;
                res = level;
            }
            level++;
        }

        return res;
    }
};
//Runtime: 216 ms, faster than 91.91% of C++ online submissions for Maximum Level Sum of a Binary Tree.
//Memory Usage: 72.3 MB, less than 100.00% of C++ online submissions for Maximum Level Sum of a Binary Tree.
```
