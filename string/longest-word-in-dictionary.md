# longest-word-in-dictionary

[https://leetcode.com/problems/longest-word-in-dictionary/](https://leetcode.com/problems/longest-word-in-dictionary/)

```
Given a list of strings words representing an English Dictionary, find the longest word in words that can be built one character at a time by other words in words. If there is more than one possible answer, return the longest word with the smallest lexicographical order.

If there is no answer, return the empty string.
Example 1:

Input: 
words = ["w","wo","wor","worl", "world"]
Output: "world"
Explanation: 
The word "world" can be built one character at a time by "w", "wo", "wor", and "worl".
Example 2:

Input: 
words = ["a", "banana", "app", "appl", "ap", "apply", "apple"]
Output: "apple"
Explanation: 
Both "apply" and "apple" can be built from other words in the dictionary. However, "apple" is lexicographically smaller than "apply".
Note:

All the strings in the input will only contain lowercase letters.
The length of words will be in the range [1, 1000].
The length of words[i] will be in the range [1, 30].
```

# thinking

结合Hint，这道题说到底其实就是查看某个单词的的所有前缀是否出现在数组中即可，那么可以将所有字符串搞到HashTable或者Set中，然后遍历字符串，列出其每一个前缀是否在集合中，就可以了，还有需要注意的是当两个字符串一致的时候，取小者，即 apple和apply 取 apply。


不过后来看论坛，有使用 **Trie** 实现的，感觉这种方案比较不错，不过代码量还是挺大的。

# solution (Trie)

```c++
#define MAX_CHILD 26
class TrieNode {
public:
    // Initialize your data structure here.
    TrieNode *child[MAX_CHILD];
    bool isWord = false;
    string word = "";
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
    void buildTrie(vector<string>& words) { 
        for(auto word: words) {
            TrieNode* node = root;
            for(char c: word) {
                if(node->child[c-'a'] == nullptr)
                    node->child[c-'a'] = new TrieNode();
                node = node->child[c-'a'];
            }
            node->isWord = true;
            node->word = word;
        }
    }
    
    string dfs(TrieNode* root) {
        string res = root->word;
        for (int i=0;i<26;i++) {
            if (root->child[i] != nullptr && root->child[i]->isWord) {
                string tmp = dfs(root->child[i]);
                if (res.length() < tmp.length()) {
                    res = tmp;
                } else if (res.compare(tmp) > 0) {
                    res = tmp;
                }
            }
        }
        
        return res;
    }
    
    string longestWord(vector<string>& words) {
        string res;
        buildTrie(words);
        
        return dfs(root);
    }
};
//Runtime: 56 ms, faster than 77.60% of C++ online submissions for Longest Word in Dictionary.
//Memory Usage: 31.5 MB, less than 20.00% of C++ online submissions for Longest Word in Dictionary.
```

# refer

[Java Trie and DFS 6ms](https://leetcode.com/problems/longest-word-in-dictionary/discuss/346118/Java-Trie-and-DFS-6ms)