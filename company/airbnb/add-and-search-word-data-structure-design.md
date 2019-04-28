# add-and-search-word-data-structure-design

[https://leetcode.com/problems/add-and-search-word-data-structure-design](https://leetcode.com/problems/add-and-search-word-data-structure-design)

```
Design a data structure that supports the following two operations:

void addWord(word)
bool search(word)
search(word) can search a literal word or a regular expression string containing only letters a-z or .. A . means it can represent any one letter.

Example:

addWord("bad")
addWord("dad")
addWord("mad")
search("pad") -> false
search("bad") -> true
search(".ad") -> true
search("b..") -> true
Note:
You may assume that all words are consist of lowercase letters a-z.
```

# solution


```c++
#define MAX_CHILD 26
class TrieNode {
public:
    // Initialize your data structure here.
    TrieNode *child[MAX_CHILD];
    bool isWord = false;
    TrieNode(){
        for (int i=0;i<MAX_CHILD;i++) {
            child[i] = nullptr;
        }
    }
};

class WordDictionary {
private:
    TrieNode *root;
public:
    /** Initialize your data structure here. */
    WordDictionary() {
        root = new TrieNode();
    }
    
    /** Adds a word into the data structure. */
    void addWord(string word) {
        TrieNode *cur = root;
        for (int i=0;i<word.size();i++) {
            if (!cur->child[word[i]-'a']) {
                cur->child[word[i]-'a'] = new TrieNode();
            }
            cur = cur->child[word[i] - 'a'];
        }
        cur->isWord = true;
    }
    
    bool search(string word, int pos, TrieNode* node) {
        for (int i=pos;i<word.size() && node;i++) {
            if (word[i] != '.') {
                node = node->child[word[i]-'a'];
            } else {
                TrieNode *tmp = node;
                for(int j=0;j<26;j++) {
                    node = tmp->child[j];
                    if(search(word, i+1, node)){
                        return true;
                    }
                }
            }
        }
        return node && node->isWord;
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    bool search(string word) {
        return search(word, 0, root);
    }
};

/**
 * Your WordDictionary object will be instantiated and called as such:
 * WordDictionary* obj = new WordDictionary();
 * obj->addWord(word);
 * bool param_2 = obj->search(word);
 */
//Runtime: 160 ms, faster than 37.52% of C++ online submissions for Add and Search Word - Data structure design.
//Memory Usage: 44.7 MB, less than 61.45% of C++ online submissions for Add and Search Word - Data structure design.
```
