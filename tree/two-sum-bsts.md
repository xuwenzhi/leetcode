# two-sum-bsts

[https://leetcode.com/problems/two-sum-bsts/](https://leetcode.com/problems/two-sum-bsts/)

```
Given two binary search trees, return True if and only if there is a node in the first tree and a node in the second tree whose values sum up to a given integer target.



Example 1:
```
![https://assets.leetcode.com/uploads/2019/05/31/1368_1_b.png](https://assets.leetcode.com/uploads/2019/05/31/1368_1_b.png)
```


Input: root1 = [2,1,4], root2 = [1,0,3], target = 5
Output: true
Explanation: 2 and 3 sum up to 5.
Example 2:

```
![https://assets.leetcode.com/uploads/2019/05/31/1368_2_b.png](https://assets.leetcode.com/uploads/2019/05/31/1368_2_b.png)
```

Input: root1 = [0,-10,10], root2 = [5,1,7,0,2], target = 18
Output: false


Constraints:

Each tree has at most 5000 nodes.
-10^9 <= target, node.val <= 10^9
```

# solution (unordered_map)

这个方案就是用个 **hashmap** 记录一个树的所有元素，然后遍历另外一个树，check **target - root->val** 是不是在map里就完事了。

Note: 不过完全没有利用到 **BST** 的特性。

不过慢是慢了点，但是还比较有效，也没看到其他什么奇技淫巧。

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
    void pushMap(TreeNode* root) {
        if (!root) return;
        pushMap(root->left);
        m.insert({root->val, true});
        pushMap(root->right);
    }

    void calSum(TreeNode* root, int sum, bool& res) {
        if (!root || res) return;
        if (m.find(sum - root->val) != m.end()) {
            res = true;
            return;
        }
        calSum(root->left, sum, res);
        calSum(root->right, sum, res);
    }

    bool twoSumBSTs(TreeNode* root1, TreeNode* root2, int target) {
        bool res = false;
        pushMap(root1);
        calSum(root2, target, res);

        return res;
    }
private:
    unordered_map<int,bool> m;
};
//Runtime: 56 ms, faster than 28.14% of C++ online submissions for Two Sum BSTs.
//Memory Usage: 30.7 MB, less than 100.00% of C++ online submissions for Two Sum BSTs.
```
