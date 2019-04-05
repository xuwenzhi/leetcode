   [5,8,4,5]
]
```

# thinking

和第一版差不多，只不过就是要遍历所有的情况，把得到的结果保存在**&vec**里即可。

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
    vector<vector<int>> pathSum(TreeNode* root, int sum) {
        vector<vector<int>> res{};
        if (!root) return res;
        vector<int> pre{};
        helper(root, pre, sum, res);
        
        return res;
    }
    
    void helper(TreeNode* root, vector<int> pre, int sum, vector<vector<int>> &vec) {
        if (!root) return;
        
        if (root->left == nullptr 
            && root->right == nullptr 
            && root->val == sum) {
            vector<int> col{};
            for (int i = 0; i < pre.size(); i++) {
                col.push_back(pre[i]);
            }
            col.push_back(root->val);
            vec.push_back(col);
            return;
        }
        pre.push_back(root->val);
        sum -= root->val;
        helper(root->left, pre, sum, vec);
        helper(root->right, pre, sum, vec);
    }
};
```

Runtime: 52 ms, faster than 5.07% of C++ online submissions for Path Sum II.

Memory Usage: 38.6 MB, less than 5.10% of C++ online submissions for Path Sum II.

