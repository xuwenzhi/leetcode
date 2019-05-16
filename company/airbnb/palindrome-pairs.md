# palindrome-pairs

[https://leetcode.com/problems/palindrome-pairs/](https://leetcode.com/problems/palindrome-pairs/)

```
Given a list of unique words, find all pairs of distinct indices (i, j) in the given list, so that the concatenation of the two words, i.e. words[i] + words[j] is a palindrome.

Example 1:

Input: ["abcd","dcba","lls","s","sssll"]
Output: [[0,1],[1,0],[3,2],[2,4]]
Explanation: The palindromes are ["dcbaabcd","abcddcba","slls","llssssll"]
Example 2:

Input: ["bat","tab","cat"]
Output: [[0,1],[1,0]]
Explanation: The palindromes are ["battab","tabbat"]
```

# solution (brute force)

用实际行动证明过了，行不通.

# solution (hashtable)

使用hashtable的方案是先将数组处理一遍，并将每一个reverse之后的字符串保存在map中，然后进行遍历.

因为回文对大致有以下两种情况

1. "abcd" "dcba"

2. "llsss" "sll"

其实还有另外一种情况，就是字符数组中可能有空字符串，不过**最多也只能有1个**，也要考虑这种情况.

```c++
class Solution {
public:
    bool isPalindrome(string s) {
        int l=0,h=s.size()-1;
        while (l < h) {
            if (s[l++] != s[h--]) return false;
        }

        return true;
    }

    vector<vector<int>> palindromePairs(vector<string>& words) {
        int l = words.size();
        vector<vector<int>> res;
        unordered_map<string,int> map;

        for (int i=0;i<l;i++) {
            string r = words[i];
            reverse(r.begin(), r.end());
            map[r] = i;
        }

        for (int i=0;i<l;i++) {
		    // handle empty string case.
            if (map.find("") != map.end() && map[""] != i && isPalindrome(words[i])) {
                res.push_back({i, map[""]});
            }
            for (int j=1;j<=words[i].size();j++) {
                string left = words[i].substr(0, j);
                string right = words[i].substr(j, words[i].size()-1);

                // for "llsss", "sll"
                // when j=2 left = lls; right=ss; m[lls] is exists,
                // so if right is palindrome, the pair is palindrome
                if (map.find(left) != map.end() && map[left] != i && isPalindrome(right)) {
                    res.push_back({i, map[left]});
                }

                // for "lls", "sssll"
                // when j=2 left = ss;right=sll; m[lls] is exists,
                // so if left is palindrome, the pair is palindrome
                if (map.find(right) != map.end() && map[right] != i && isPalindrome(left)) {
                    res.push_back({map[right], i});
                }
            }
        }

        return res;
    }
};
//Runtime: 268 ms, faster than 57.74% of C++ online submissions for Palindrome Pairs.
//Memory Usage: 48.6 MB, less than 63.25% of C++ online submissions for Palindrome Pairs.
```

# solution (Trie)

这种是用到了Trie的思路，关于Tire可以看[[Medium]implement-trie-prefix-tree - Trie树](https://github.com/xuwenzhi/leetcode/blob/master/design/implement-trie-prefix-tree.md)，具体可以看这个图.

![https://github.com/xuwenzhi/leetcode/raw/master/images/palindrome-pairs.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/palindrome-pairs.jpg)

```c++
#define MAX_CHILD 26
class TrieNode {
public:
    TrieNode *child[MAX_CHILD];
    int  index = -1;
    vector<int> indices; // store all index of palindrome string that start from current node.
    TrieNode(){
        for (int i=0;i<MAX_CHILD;i++) {
            child[i] = nullptr;
        }
    }
};

class Solution {
private:
    TrieNode* root = new TrieNode();
public:
    bool isPalindrome(string s) {
        int l=0,h=s.size()-1;
        while (l < h) {
            if (s[l++] != s[h--]) return false;
        }

        return true;
    }

    /** Inserts a word into the trie. */
    void insert(string word, int index) {
        TrieNode *cur = root;
        for (int i=0;i<word.size();i++) {
            // tail is palindrome, push to current node's indices
            if (isPalindrome(word.substr(i, word.size()))) {
                cur->indices.push_back(index);
            }
            if (cur->child[word[i]-'a'] == nullptr) {
                cur->child[word[i]-'a'] = new TrieNode();
            }
            cur = cur->child[word[i] - 'a'];
        }
        cur->indices.push_back(index);
        cur->index  = index;
    }

    void find(int i, string word, vector<vector<int>>& res) {
        TrieNode* node = root;

        int l = word.size();
        for (int j=0;j<l && node;j++) {
            if (node->index >= 0
                && node->index != i
                && isPalindrome(word.substr(j, l))) {
                res.push_back({i, node->index});
            }
            node = node->child[word[j]-'a'];
        }

        if (node) {
            for (int idx : node->indices) {
                if (i != idx) res.push_back({i, idx});
            }
        }
    }

    vector<vector<int>> palindromePairs(vector<string>& words) {
        int l = words.size();
        vector<vector<int>> res;

        for (int i=0;i<l;i++) {
            TrieNode* dummy = root;
            string t = words[i];
            reverse(t.begin(), t.end());
            insert(t, i);
        }

        for (int i=0;i<l;i++) {
            find(i, words[i], res);
        }

        return res;
    }
};
//Runtime: 240 ms, faster than 77.61% of C++ online submissions for Palindrome Pairs.
//Memory Usage: 221.7 MB, less than 13.13% of C++ online submissions for Palindrome Pairs.
```
