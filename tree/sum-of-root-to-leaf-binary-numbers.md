# sum-of-root-to-leaf-binary-numbers

[https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/](https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/)

```
Given a binary tree, each node has value 0 or 1.  Each root-to-leaf path represents a binary number starting with the most significant bit.  For example, if the path is 0 -> 1 -> 1 -> 0 -> 1, then this could represent 01101 in binary, which is 13.

For all leaves in the tree, consider the numbers represented by the path from the root to that leaf.

Return the sum of these numbers.

Example 1:

```
![https://assets.leetcode.com/uploads/2019/04/04/sum-of-root-to-leaf-binary-numbers.png](https://assets.leetcode.com/uploads/2019/04/04/sum-of-root-to-leaf-binary-numbers.png)
```
Input: [1,0,1,0,1,0,1]
Output: 22
Explanation: (100) + (101) + (110) + (111) = 4 + 5 + 6 + 7 = 22


Note:

The number of nodes in the tree is between 1 and 1000.
node.val is 0 or 1.
The answer will not exceed 2^31 - 1.
```

# thinking

这道题原本是第131周的Contest的题，上周终于参加了人生中的第一次Contest，能力有限，也只琢磨了这道题。
正常来讲这道题还是很容易的，和之前做的[[Easy]path-sum](https://github.com/xuwenzhi/leetcode/blob/master/tree/path-sum.md)系列很类似，不过在Contest的时候，这道题长得并不是现在这样子的，每一个path是很可能会溢出，不过当时我也没有解决溢出这个问题，真是汗颜。。

由于降低了难度，所以这道题解决起来就不是很难受了。

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
    int sumRootToLeaf(TreeNode* root) {
        vector<int> res{};

        preorder(root, 0, res);
        return accumulate(res.begin(), res.end(), 0);
    }

    void preorder(TreeNode* root, int pre, vector<int> &vec) {
        if (!root) return;
        pre = pre * 2 + root->val;
        if (!root->left && !root->right) {
            vec.push_back(pre);
        }
        preorder(root->left, pre, vec);
        preorder(root->right, pre, vec);
    }
};
```

Runtime: 12 ms, faster than 99.18% of C++ online submissions for Sum of Root To Leaf Binary Numbers.

Memory Usage: 17 MB, less than 100.00% of C++ online submissions for Sum of Root To Leaf Binary Numbers.
