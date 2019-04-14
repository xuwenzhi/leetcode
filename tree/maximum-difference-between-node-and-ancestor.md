# maximum-difference-between-node-and-ancestor

[https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/](https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/)

```
Given the root of a binary tree, find the maximum value V for which there exists different nodes A and B where V = |A.val - B.val| and A is an ancestor of B.

(A node A is an ancestor of B if either: any child of A is equal to B, or any child of A is an ancestor of B.)



Example 1:
```
![http://i68.tinypic.com/2whqcep.jpg](http://i68.tinypic.com/2whqcep.jpg)
```
Input: [8,3,10,1,6,null,14,null,null,4,7,13]
Output: 7
Explanation:
We have various ancestor-node differences, some of which are given below :
|8 - 3| = 5
|3 - 7| = 4
|8 - 1| = 7
|10 - 13| = 3
Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 7.


Note:

The number of nodes in the tree is between 2 and 5000.
Each node will have value between 0 and 100000.
```

# thinking

第132周的Contest，通过的题目。

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
    int maxAncestorDiff(TreeNode* root) {
        if (!root) return 0;
        vector<int> pre{};
        int res = 0;
        helper(root, pre, res);

        return res;
    }

    void helper(TreeNode* root, vector<int> pre, int &max) {
        if (!root) return ;

        for (int i=0;i<pre.size();i++) {
            max = abs(pre[i] - root->val) > max ? abs(pre[i] - root->val) : max;
        }
        pre.push_back(root->val);
        helper(root->left, pre, max);
        helper(root->right, pre, max);
    }
};
//Runtime: 176 ms, faster than 100.00% of C++ online submissions for Maximum Difference Between Node and Ancestor.
//Memory Usage: 222 MB, less than 100.00% of C++ online submissions for Maximum Difference Between Node and Ancestor.
```
