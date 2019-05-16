# implement-trie-prefix-tree

[https://leetcode.com/problems/implement-trie-prefix-tree/](https://leetcode.com/problems/implement-trie-prefix-tree/)

```
Implement a trie with insert, search, and startsWith methods.

Example:

Trie trie = new Trie();

trie.insert("apple");
trie.search("apple");   // returns true
trie.search("app");     // returns false
trie.startsWith("app"); // returns true
trie.insert("app");
trie.search("app");     // returns true
Note:

You may assume that all inputs are consist of lowercase letters a-z.
All inputs are guaranteed to be non-empty strings.
```

# thinking

Trie, 也就是前缀树或者字典树，详细见维基[Trie](https://zh.wikipedia.org/wiki/Trie)

![https://upload.wikimedia.org/wikipedia/commons/b/be/Trie_example.svg](https://upload.wikimedia.org/wikipedia/commons/b/be/Trie_example.svg)
图片来自维基百科

# solution (Regular)

每一个节点处保存一个字符，并且通过isTail保存是否在此节点行程一个单词.

```
#define MAX_CHILD 26
class TrieNode {
public:
    // Initialize your data structure here.
    TrieNode *child[MAX_CHILD];
    bool isTail = false;
    TrieNode(){
        for (int i=0;i<MAX_CHILD;i++) {
            child[i] = nullptr;
        }
    }
};

class Trie {
TrieNode* root;
public:
    /** Initialize your data structure here. */
    Trie() {
        root = new TrieNode();
    }

    /** Inserts a word into the trie. */
    void insert(string word) {
        TrieNode *cur = root;
        for (int i=0;i<word.size();i++) {
            if (cur->child[word[i]-'a'] == nullptr) {
                cur->child[word[i]-'a'] = new TrieNode();
            }
            cur = cur->child[word[i] - 'a'];
            if (i == word.size()-1) {
                cur->isTail = true;
            }
        }
    }

    /** Returns if the word is in the trie. */
    bool search(string word) {
        TrieNode *cur = root;
        int i = 0, len = word.size();
        while (i < len) {
            cur = cur->child[word[i]-'a'];
            if (cur == nullptr) break;
            i++;
        }

        if (cur == nullptr) return false;

        return cur->isTail;
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    bool startsWith(string prefix) {
        TrieNode *cur = root;
        int i = 0, len = prefix.size();
        while (i < len) {
            cur = cur->child[prefix[i]-'a'];
            if (cur == nullptr) return false;
            i++;
        }

        return i == len;
    }
};

/**
 * Your Trie object will be instantiated and called as such:
 * Trie* obj = new Trie();
 * obj->insert(word);
 * bool param_2 = obj->search(word);
 * bool param_3 = obj->startsWith(prefix);
 */
//Runtime: 84 ms, faster than 75.04% of C++ online submissions for Implement Trie (Prefix Tree).
//Memory Usage: 44.9 MB, less than 55.02% of C++ online submissions for Implement Trie (Prefix Tree).
```

# further thinking

另外有通过两个数组和三个数组实现的Trie.

[双数组Trie树 (Double-array Trie) 及其应用](https://www.cnblogs.com/en-heng/p/6265256.html)
