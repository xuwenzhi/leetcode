# two-sum-iv-input-is-a-bst

[https://leetcode.com/problems/two-sum-iv-input-is-a-bst/](https://leetcode.com/problems/two-sum-iv-input-is-a-bst/)

```
Given a Binary Search Tree and a target number, return true if there exist two elements in the BST such that their sum is equal to the given target.

Example 1:

Input:
    5
   / \
  3   6
 / \   \
2   4   7

Target = 9

Output: True


Example 2:

Input:
    5
   / \
  3   6
 / \   \
2   4   7

Target = 28

Output: False
```

# thinking

At First Glance：是想通过BST的特性来解决，但是画图画了一下貌似不太有思路。

后来一想，是不是可以遍历一次然后保存在一个vector<int>中再来个binary search 呢?

所以后来也是这么做了。

# solution (Brief， Convert to sorted array.)

```c++
// O(NlogN) Runtime O(N) Space
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
    bool findTarget(TreeNode* root, int k) {
        if (!root) return false;
        vector<int> vec;
        helper(root, vec);
        int low = 0, high = vec.size()-1;
        while (low < high) {
            int sum = vec[low] + vec[high];
            if (sum == k) return true;
            else if (sum < k) {
                low++;
            } else {
                high--;
            }
        }

        return false;
    }

    void helper(TreeNode* root, vector<int> &vec) {
        if (!root) return;
        helper(root->left, vec);
        vec.push_back(root->val);;
        helper(root->right, vec);
    }
};
//Runtime: 44 ms, faster than 98.59% of C++ online submissions for Two Sum IV - Input is a BST.
//Memory Usage: 24.7 MB, less than 100.00% of C++ online submissions for Two Sum IV - Input is a BST.
```

# rethinking

后来参考[[Java/C++] Three simple methods - choose one you like](https://leetcode.com/problems/two-sum-iv-input-is-a-bst/discuss/106059/)，还真是牛逼呀，这里使用了**Set**来处理已遍历过的点，只需要O(N) Runtime，O(logN) Space即可解决问题，话说，其实用hashmap也可以的.

# solution (Set or Hashmap)

```c++
// O(n) Runtime O(n) Space
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
    bool findTarget(TreeNode* root, int k) {
        if (!root) return false;
        unordered_set<int> set{};

        return helper(root, set, k);
    }

    bool helper(TreeNode* root, unordered_set<int> &set, int k) {
        if (!root) return false;
        if (set.count(k - root->val) > 0) {
            return true;
        }
        set.insert(root->val);

        return helper(root->left, set, k) || helper(root->right, set, k);
    }
};
//Runtime: 48 ms, faster than 90.87% of C++ online submissions for Two Sum IV - Input is a BST.
//Memory Usage: 26.1 MB, less than 99.44% of C++ online submissions for Two Sum IV - Input is a BST.
```
