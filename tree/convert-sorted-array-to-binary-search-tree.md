# convert-sorted-array-to-binary-search-tree

[https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/)

```
Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example:

Given the sorted array: [-10,-3,0,5,9],

One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

      0
     / \
   -3   9
   /   /
 -10  5

```


# solution (recursion)

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
    TreeNode* sortedArrayToBST(vector<int>& nums) {
        int len = nums.size();
        if (len == 0) return nullptr;
        int median = (len-1) / 2;

        TreeNode* root= helper(nums, 0, len-1);

        return root;
    }

    TreeNode* helper(vector<int> nums, int low, int high) {
        if (low > high) return nullptr;
        int median = low + (high - low) / 2;
        TreeNode* newnode = new TreeNode(nums[median]);

        newnode->left = helper(nums, low, median-1);
        newnode->right = helper(nums, median+1, high);

        return newnode;
    }
};
//Runtime: 380 ms, faster than 5.01% of C++ online submissions for Convert Sorted Array to Binary Search Tree.
//Memory Usage: 361.4 MB, less than 6.23% of C++ online submissions for Convert Sorted Array to Binary Search Tree.
```

所以这个时间非常久，经过排查，发现问题是这样的，helper函数中的**nums**，在每次调用时都需要大量的**copy**操作，导致时间很久。

```
TreeNode* helper(vector<int> nums, int low, int high);
```


# solution (reference)

```c++
// O(n) Runtime, O(logn) Space.
// 每个元素都需要处理一遍所以Runtime为O(n).递归调用栈为O(logn).
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
    TreeNode* sortedArrayToBST(vector<int>& nums) {
        int len = nums.size();
        if (len == 0) return nullptr;
        int median = (len-1) / 2;

        TreeNode* root= helper(nums, 0, len-1);

        return root;
    }

    TreeNode* helper(vector<int> &nums, int low, int high)       {
        if (low > high) return nullptr;
        int median = low + (high - low) / 2;
        TreeNode* newnode = new TreeNode(nums[median]);

        newnode->left = helper(nums, low, median-1);
        newnode->right = helper(nums, median+1, high);

        return newnode;
    }
};
//Runtime: 24 ms, faster than 85.73% of C++ online submissions for Convert Sorted Array to Binary Search Tree.
//Memory Usage: 21 MB, less than 85.76% of C++ online submissions for Convert Sorted Array to Binary Search Tree.
```
