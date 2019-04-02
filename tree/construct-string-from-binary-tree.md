# construct-string-from-binary-tree

[https://leetcode.com/problems/construct-string-from-binary-tree/](https://leetcode.com/problems/construct-string-from-binary-tree/)

```
You need to construct a string consists of parenthesis and integers from a binary tree with the preorder traversing way.

The null node needs to be represented by empty parenthesis pair "()". And you need to omit all the empty parenthesis pairs that don't affect the one-to-one mapping relationship between the string and the original binary tree.

Example 1:

Input: Binary tree: [1,2,3,4]
       1
     /   \
    2     3
   /
  4

Output: "1(2(4))(3)"

Explanation: Originallay it needs to be "1(2(4)())(3()())",
but you need to omit all the unnecessary empty parenthesis pairs.
And it will be "1(2(4))(3)".
Example 2:

Input: Binary tree: [1,2,3,null,4]
       1
     /   \
    2     3
     \
      4

Output: "1(2()(4))(3)"

Explanation: Almost the same as the first example,
except we can't omit the first parenthesis pair to break the one-to-one mapping relationship between the input and the output.
```

# thinking

将二叉树转换为带有包含关系的字符串，使用"()"来表示包含关系。最好理解的必然就是递归了，所以给个人给出的方案也是使用递归。

Notice :有的节点会右节点，而左节点为null，故左节点需要带有 "()"，例如 "[1,2,3, null, 4]" 结果应为 "1(2()(4))(3)"，因为2只有右子节点，左子节点为null，但是需要用"()" 补充

# solution

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
    string tree2str(TreeNode* t) {
        string s;
        s = helper(t);
        return s;
    }

    string helper(TreeNode* t) {
        if (!t) return "";
        string s = to_string(t->val);
        string left = helper(t->left);
        string right = helper(t->right);

        if (left != "" ^ right != "") {
            s += "(" + left + ")";
            if (right != "") s += "(" + right + ")";
            return s;
        }

        if (left != "") {
            s += "(" + left + ")";
        }
        if (right != "") {
            s += "(" + right + ")";
        }

        return s;
    }
};
```
Runtime: 56 ms, faster than 31.19% of C++ online submissions for Construct String from Binary Tree.

Memory Usage: 67.8 MB, less than 9.58% of C++ online submissions for Construct String from Binary Tree.
