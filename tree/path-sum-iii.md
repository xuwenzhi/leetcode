# path-sum-iii

[https://leetcode.com/problems/path-sum-iii/](https://leetcode.com/problems/path-sum-iii/)

```
You are given a binary tree in which each node contains an integer value.

Find the number of paths that sum to a given value.

The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).

The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.

Example:

root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8

      10
     /  \
    5   -3
   / \    \
  3   2   11
 / \   \
3  -2   1

Return 3. The paths that sum to 8 are:

1.  5 -> 3
2.  5 -> 2 -> 1
3. -3 -> 11
```

# thinking

我的思路是来一个层序遍历，然后使用一个vector<int>来保存从头到尾过来的path，缺点是需要使用pre空间来保存，并且每到一个节点，都需要从尾到头遍历pre，然后找到是否有相加与sum相等的。

不过后来看到discuss，发现其实还是有一种新的方案，不用维护pre，直接从头到尾比对的。

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
    int pathSum(TreeNode* root, int sum) {
        if (!root) return 0;
        
        vector<int> pre{};
        int nums = 0;
        helper(root, pre, sum, nums);
        
        return nums;
    }
    
    void helper(TreeNode* root, vector<int> pre, int sum, int &nums) {
        if (!root) return;
        int inner_sum = sum;
        pre.push_back(root->val);
        for (int i = pre.size()-1; i >= 0;i--) {
            inner_sum -= pre[i];
            if (inner_sum == 0) nums++;
        }
        helper(root->left, pre, sum, nums);
        helper(root->right, pre, sum, nums);
    }
};
```

Runtime: 60 ms, faster than 8.61% of C++ online submissions for Path Sum III.

Memory Usage: 63.5 MB, less than 10.53% of C++ online submissions for Path Sum III.


# solution （From head to tail）

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
    int pathSum(TreeNode* root, int sum) {
        if (!root) return 0;
        // 在此方法中调用helper(root, pre, sum)实际上是计算所有由根节点出发的这条路径上存在的有效路径，然后依次转移到left和right.
        return helper(root, 0, sum) + pathSum(root->left, sum) + pathSum(root->right, sum);
    }
    
    int helper(TreeNode* root, int pre, int sum) {
        if (!root) return 0;
        int current = pre + root->val;
        
        return (current == sum) + helper(root->left, current, sum) + helper(root->right, current, sum);
    }
};
```

Runtime: 28 ms, faster than 73.69% of C++ online submissions for Path Sum III.

Memory Usage: 14.7 MB, less than 100.00% of C++ online submissions for Path Sum III.



