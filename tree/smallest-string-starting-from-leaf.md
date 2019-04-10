# smallest-string-starting-from-leaf

[https://leetcode.com/problems/smallest-string-starting-from-leaf/](https://leetcode.com/problems/smallest-string-starting-from-leaf/)

```
Given the root of a binary tree, each node has a value from 0 to 25 representing the letters 'a' to 'z': a value of 0 represents 'a', a value of 1 represents 'b', and so on.

Find the lexicographically smallest string that starts at a leaf of this tree and ends at the root.

(As a reminder, any shorter prefix of a string is lexicographically smaller: for example, "ab" is lexicographically smaller than "aba".  A leaf of a node is a node that has no children.)



Example 1:
```
![https://assets.leetcode.com/uploads/2019/01/30/tree1.png](https://assets.leetcode.com/uploads/2019/01/30/tree1.png)
```
Input: [0,1,2,3,4,3,4]
Output: "dba"
Example 2:
```
![https://assets.leetcode.com/uploads/2019/01/30/tree2.png](https://assets.leetcode.com/uploads/2019/01/30/tree2.png)
```

Input: [25,1,3,1,3,0,2]
Output: "adz"
Example 3:

```
![https://assets.leetcode.com/uploads/2019/02/01/tree3.png](https://assets.leetcode.com/uploads/2019/02/01/tree3.png)
```
Input: [2,2,1,null,1,0,null,0]
Output: "abc"

Note:

The number of nodes in the given tree will be between 1 and 8500.
Each node in the tree will have a value between 0 and 25.
```

# thinking

我的思路是先进行preorder并记录所有从叶子节点到根节点的路径，这样就得到了一个二维string vector，然后再排个序返回第一个元素即可，不过效率不是很高，主要瓶颈点就在排序这里了。

# my solution

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
    string smallestFromLeaf(TreeNode* root) {
        if (!root) return "";
        string res = "", pre = "";
        vector<string> vec{};
        helper(root, pre, vec);
        sort(std::begin(vec), std::end(vec));

        return vec[0];
    }

    void helper(TreeNode* root, string pre, vector<string> &vec) {
        if (!root) return;
        pre = "abcdefghijklmnopqrstuvwxyz"[root->val] + pre;
        if (!root->left && !root->right) vec.push_back(pre);

        helper(root->left, pre, vec);
        helper(root->right, pre, vec);
    }
};
```
Runtime: 20 ms, faster than 26.85% of C++ online submissions for Smallest String Starting From Leaf.

Memory Usage: 20.6 MB, less than 5.52% of C++ online submissions for Smallest String Starting From Leaf.

# solution (recursive)

这个解决思路和[https://github.com/xuwenzhi/leetcode/blob/master/tree/path-sum-iii.md](https://github.com/xuwenzhi/leetcode/blob/master/tree/path-sum-iii.md)做法基本一致，虽然题目要求比对从叶子到根的数值，但想法都是从头就开始比对起.

```
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
    string smallestFromLeaf(TreeNode* root) {
        if (!root) return "";

        return helper(root, "");
    }

    string helper(TreeNode* root, string pre) {
        // ~ is 126, always greater than [a-z], because sometimes it's return empty string
        if (!root) return "~";

        string current = "abcdefghijklmnopqrstuvwxyz"[root->val] + pre;
        return (root->left == root->right) ? current : min(helper(root->left, current), helper(root->right, current));
    }
};
```

Runtime: 16 ms, faster than 64.85% of C++ online submissions for Smallest String Starting From Leaf.

Memory Usage: 19.7 MB, less than 5.52% of C++ online submissions for Smallest String Starting From Leaf.


# conclusion

1. Get a-z char "abcdefghijklmnopqrstuvwxyz"[root->val]
