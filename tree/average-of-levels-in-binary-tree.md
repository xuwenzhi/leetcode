# average-of-levels-in-binary-tree

[https://leetcode.com/problems/average-of-levels-in-binary-tree/](https://leetcode.com/problems/average-of-levels-in-binary-tree/)

```
Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
Example 1:

Input:
    3
   / \
  9  20
    /  \
   15   7
Output: [3, 14.5, 11]
Explanation:
The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
Note:

The range of node's value is in the range of 32-bit signed integer.
```

# thinking

和[[easy]binary-tree-level-order-traversal-ii](https://github.com/xuwenzhi/leetcode/blob/master/tree/binary-tree-level-order-traversal-ii.md)差不多，只不过这回是计算每层的平均数，注意Overflow就可以了.

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
    double average(vector<int> vec) {
        long sum = 0, len = vec.size();
        double res = 0;
        for (int i = 0; i < len; i++) {
            sum += vec[i];
        }
        return (double)sum / len;
    }

    vector<double> averageOfLevels(TreeNode* root) {
        vector<double> vec{};
        if (!root) return vec;
        int index = 0, qLen = 0;
        TreeNode* tmp;
        vector<int> col;
        queue<TreeNode*> q{{root}};
        while (!q.empty()) {
            col.clear();
            qLen = q.size();
            for (int i = 0; i < qLen; i++) {
                tmp = q.front();
                q.pop();
                col.push_back(tmp->val);
                if (tmp->left)  q.push(tmp->left);
                if (tmp->right) q.push(tmp->right);
            }

            vec.push_back(average(col));
            index++;
        }

        return vec;
    }
};
```

Runtime: 24 ms, faster than 99.02% of C++ online submissions for Average of Levels in Binary Tree.

Memory Usage: 22.1 MB, less than 69.91% of C++ online submissions for Average of Levels in Binary Tree.
