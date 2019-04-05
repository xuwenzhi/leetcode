# second-minimum-node-in-a-binary-tree

[https://leetcode.com/problems/second-minimum-node-in-a-binary-tree/](https://leetcode.com/problems/second-minimum-node-in-a-binary-tree/)

```
Given a non-empty special binary tree consisting of nodes with the non-negative value, where each node in this tree has exactly two or zero sub-node. If the node has two sub-nodes, then this node's value is the smaller value among its two sub-nodes.

Given such a binary tree, you need to output the second minimum value in the set made of all the nodes' value in the whole tree.

If no such second minimum value exists, output -1 instead.

Example 1:

Input: 
    2
   / \
  2   5
     / \
    5   7

Output: 5
Explanation: The smallest value is 2, the second smallest value is 5.
Example 2:

Input: 
    2
   / \
  2   2

Output: -1
Explanation: The smallest value is 2, but there isn't any second smallest value.
```

# thinking

正常来讲这道题其实不是很复杂，遍历一遍树保存在vector<int>里，做一遍排序就完事了。

Notice : 注意会出现以下这种情况，也就是第二个最大的数在很深层次的位置。

```
        1
      /   \
     1     3
    / \   / \
   1   2 3   4
```


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
    int findSecondMinimumValue(TreeNode* root) {
        if (!root) return -1;
        vector<int> vec{};
        vec.push_back(root->val);
        secondValue(root, vec);
        
        if (vec.size() <= 1) return -1;
        
        sort(vec.begin(), vec.end());
        
        return vec[1];
    }
    
    void secondValue(TreeNode* root, vector<int> &vec) {
        if (!root) return;
        if (root->val != vec[0]) {
            vec.push_back(root->val);
            if (root->val == (vec[0] + 1)) return; // maybe decrease some function call.
        }
        
        TreeNode* left = root->left;
        TreeNode* right = root->right;
        secondValue(root->left, vec);
        secondValue(root->right, vec);
    }
};
```

Runtime: 4 ms, faster than 100.00% of C++ online submissions for Second Minimum Node In a Binary Tree.

Memory Usage: 8.8 MB, less than 48.08% of C++ online submissions for Second Minimum Node In a Binary Tree.
