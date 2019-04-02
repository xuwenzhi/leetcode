# mimimum-depth-of-binary-tree

[https://leetcode.com/problems/minimum-depth-of-binary-tree/](https://leetcode.com/problems/minimum-depth-of-binary-tree/)

```
Given a binary tree, find its minimum depth.

The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

Note: A leaf is a node with no children.

Example:

Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
return its minimum depth = 2.
```

# thinking


注意题目中的Note:A leaf is a node with no children. 也就是没有子节点的才算是leaf，所以递归的终止条件中**root->left == nullptr && root->right == nullptr**是必不可少的。

其次注意一下这种情况

```
	    1
       /
     2
    /
   3
  /
4
```

### 做这道题的心路历程

最开始只想通过递归实现，但是后来发现层序遍历应该是最好理解的一个解决方案了.

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
    int minDepth(TreeNode* root) {
        if (!root) {
            return 0;
        }
        if (root->left != nullptr && root->right == nullptr) {
            return 1 + minDepth(root->left);
        }
        if (root->left == nullptr && root->right != nullptr) {
            return 1 + minDepth(root->right);
        }
        if (!root->left && !root->right) return 1;

        return 1 + min(minDepth(root->left), minDepth(root->right));
    }
};
```

Runtime: 16 ms, faster than 99.24% of C++ online submissions for Minimum Depth of Binary Tree.

Memory Usage: 20 MB, less than 21.82% of C++ online submissions for Minimum Depth of Binary Tree.


# DFS and BFS solution (By [wfei26](https://leetcode.com/wfei26))

```
/** Solution 1: DFS
 * Key point:
 * if a node only has one child -> MUST return the depth of the side with child, i.e. MAX(left, right) + 1
 * if a node has two children on both side -> return min depth of two sides, i.e. MIN(left, right) + 1
 * */
public int minDepth(TreeNode root) {
    if (root == null) {
        return 0;
    }

    int left = minDepth(root.left);
    int right = minDepth(root.right);
    if (left == 0 || right == 0) {
        return Math.max(left, right) + 1;
    }
    else {
        return Math.min(left, right) + 1;
    }
}


/** Solution 2: BFS level order traversal */
/**
 * 一排一排遍历，直到率先满足 **curNode.left == null && curNode.right == null** 即可返回.
 */
public int minDepth2(TreeNode root) {
    if (root == null) {
        return 0;
    }
    Queue<TreeNode> queue = new LinkedList<>();
    queue.offer(root);
    int level = 1;
    while (!queue.isEmpty()) {
        int size = queue.size();
        for (int i = 0; i < size; i++) {
            TreeNode curNode = queue.poll();
            if (curNode.left == null && curNode.right == null) {
                return level;
            }
            if (curNode.left != null) {
                queue.offer(curNode.left);
            }
            if (curNode.right != null) {
                queue.offer(curNode.right);
            }
        }
        level++;
    }
    return level;
}
```


# more

[3 lines in every language](https://leetcode.com/problems/minimum-depth-of-binary-tree/discuss/36060/3-lines-in-Every-Language)
