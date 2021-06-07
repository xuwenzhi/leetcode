# sort-characters-by-frequency

[https://leetcode.com/problems/search-suggestions-system/](https://leetcode.com/problems/search-suggestions-system/)

```
Given an array of strings products and a string searchWord. We want to design a system that suggests at most three product names from products after each character of searchWord is typed. Suggested products should have common prefix with the searchWord. If there are more than three products with a common prefix return the three lexicographically minimums products.

Return list of lists of the suggested products after each character of searchWord is typed. 

 

Example 1:

Input: products = ["mobile","mouse","moneypot","monitor","mousepad"], searchWord = "mouse"
Output: [
["mobile","moneypot","monitor"],
["mobile","moneypot","monitor"],
["mouse","mousepad"],
["mouse","mousepad"],
["mouse","mousepad"]
]
Explanation: products sorted lexicographically = ["mobile","moneypot","monitor","mouse","mousepad"]
After typing m and mo all products match and we show user ["mobile","moneypot","monitor"]
After typing mou, mous and mouse the system suggests ["mouse","mousepad"]
Example 2:

Input: products = ["havana"], searchWord = "havana"
Output: [["havana"],["havana"],["havana"],["havana"],["havana"],["havana"]]
Example 3:

Input: products = ["bags","baggage","banner","box","cloths"], searchWord = "bags"
Output: [["baggage","bags","banner"],["baggage","bags","banner"],["baggage","bags"],["bags"]]
Example 4:

Input: products = ["havana"], searchWord = "tatiana"
Output: [[],[],[],[],[],[],[]]
 

Constraints:

1 <= products.length <= 1000
There are no repeated elements in products.
1 <= Σ products[i].length <= 2 * 10^4
All characters of products[i] are lower-case English letters.
1 <= searchWord.length <= 1000
All characters of searchWord are lower-case English letters.
```

# thinking

几个点需要注意:

1. 最后得到的结果是要按照字母顺序排序的

2. 还需要注意字符串匹配时，两者长度的问题，防止越界


# solution (Regular)

```c++
// searchWord length : m
// products size : n
// O(m*n*m*log(n))
class Solution {
public:
    vector<vector<string>> suggestedProducts(vector<string>& products, string searchWord) {
        vector<vector<string>> result;
        
        int searchWordLen = searchWord.length();
        for (int i = 0; i < searchWordLen; i++) {
            map<string, bool> tmp;
            for (auto product : products) {
                if (product.length() >= i + 1 && product.substr(0, i + 1) == searchWord.substr(0, i + 1)) {
                    tmp[product] = true;
                }
            }

            vector<string> rows;
            for (auto p: tmp) {
                rows.push_back(p.first);
                if (rows.size() >= 3) {
                    break;
                }
            }
            result.push_back(rows);
        }
        
        return result;
    }
};
// Runtime: 644 ms, faster than 13.67% of C++ online submissions for Search Suggestions System.
// Memory Usage: 239.3 MB, less than 10.73% of C++ online submissions for Search Suggestions System.
```

这种算法就有点笨拙了，因为是按照字母一个接着一个匹配，那么如何做到后面的计算可以复用前面的计算呢？意思是比如这样的case

```
products = ["bags","baggage","banner","box","cloths"], searchWord = "bags"
```
当计算 banner 并且是计算第 **3** 个字符时，已经确定 banner 不会出现在后面的结果里了，那么是可以将它 **remove** 的，那么只需要每一次循环 **判断当前的 character** 即可。

一种思路，不要 **重复计算**。




# solution (Trie)

这道题实际上是有Hint的，给出了 **Trie** 来做这道题，看看。

```c++
// searchWord length : m
// products size : n
// O(m*n*log(26))
#define MAX_CHILD 26
class TrieNode {
public:
    // Initialize your data structure here.
    TrieNode *child[MAX_CHILD];
    bool isTail = false;
    vector<string> words; // Store those words that pass through this node
    TrieNode(){
        for (int i = 0; i < MAX_CHILD; i++) {
            child[i] = nullptr;
        }
    }
};

class Solution {
public:
    /** Inserts a word into the trie. */
    void insert(string word) {
        TrieNode *cur = trieNode;
        for (int i = 0; i < word.size(); i++) {
            if (cur->child[word[i]-'a'] == nullptr) {
                cur->child[word[i]-'a'] = new TrieNode();
            }
            cur = cur->child[word[i] - 'a'];
            cur->words.push_back(word); // store word
            if (i == word.size() - 1) {
                cur->isTail = true;
            }
        }
    }
    
    vector<string> search(string word) {
        vector<string> result;
        TrieNode* cur = trieNode;
        for (int i = 0; i < word.size(); i++) {
            if (cur->child[word[i] - 'a'] == nullptr) {
                break;
            }
            cur = cur->child[word[i] - 'a'];
            if (i == word.length() - 1) {
                reverse(cur->words.begin(), cur->words.end());
                return cur->words;
            }
        }
        
        return result;
    }
    
    vector<vector<string>> suggestedProducts(vector<string>& products, string searchWord) {
        vector<vector<string>> result(searchWord.length());
        for (auto product : products) {
            insert(product);
        }
        
        vector<string> searchResult;
        for (int i = 0; i < searchWord.length(); i++) {
            searchResult = search(searchWord.substr(0, i+1));
            sort(searchResult.begin(), searchResult.end()); // sort
            int rowLen = searchResult.size() >= 3 ? 3 : searchResult.size();
            result[i] = vector(searchResult.begin(), searchResult.begin() + rowLen);
        }
        
        return result;
    }
    
private:
    TrieNode* trieNode = new TrieNode();
};
//Runtime: 192 ms, faster than 33.84% of C++ online submissions for Search Suggestions System.
//Memory Usage: 134.8 MB, less than 20.41% of C++ online submissions for Search Suggestions System.
```


# solution (Trie again)

根据上面的优化一下。

```c++
#define MAX_CHILD 26
class TrieNode {
public:
    // Initialize your data structure here.
    TrieNode *child[MAX_CHILD];
    bool isTail = false;
    vector<string> words;
    TrieNode(){
        for (int i = 0; i < MAX_CHILD; i++) {
            child[i] = nullptr;
        }
    }
};

class Solution {
public:
    /** Inserts a word into the trie. */
    void insert(string word) {
        TrieNode *cur = trieNode;
        for (int i = 0; i < word.size(); i++) {
            if (cur->child[word[i]-'a'] == nullptr) {
                cur->child[word[i]-'a'] = new TrieNode();
            }
            cur = cur->child[word[i] - 'a'];
            cur->words.push_back(word);
            if (i == word.size() - 1) {
                cur->isTail = true;
            }
        }
    }
    
    vector<vector<string>> suggestedProducts(vector<string>& products, string searchWord) {
        vector<vector<string>> result(searchWord.length());
        for (auto product : products) {
            insert(product);
        }
        
        vector<string> searchResult;
        cur = trieNode;
        for (int i = 0; i < searchWord.length(); i++) {
            cur = cur->child[searchWord[i] - 'a'];
            if (cur == nullptr) {
                result[i] = {};
                break;
            }
            searchResult = cur->words;
            sort(searchResult.begin(), searchResult.end());
            int rowLen = searchResult.size() < 3 ? searchResult.size() : 3;
            result[i] = vector(searchResult.begin(), searchResult.begin() + rowLen);
        }
        
        return result;
    }
    
private:
    TrieNode* trieNode = new TrieNode();
    TrieNode* cur;
};
//Runtime: 128 ms, faster than 44.65% of C++ online submissions for Search Suggestions System.
//Memory Usage: 117.6 MB, less than 23.33% of C++ online submissions for Search Suggestions System.
```


# solution (BEST)

看完discussion之后，顿时醍醐灌顶，好吧，直接排序，然后二分查找。

**其实这道题的结果在排序之后，都在一块儿，其实就应该想到 binary search**

```
//O(nlog(n))
class Solution {
public:
    vector<vector<string>> suggestedProducts(vector<string>& products, string searchWord) {
        vector<vector<string>> result;
        
        sort(products.begin(), products.end());
        string cur;
        auto it = products.begin();
        for (auto c :searchWord) {
            cur += c;
            vector<string> suggested;
            it = lower_bound(it, products.end(), cur); // lower_bound
            for (int i = 0; i < 3 && it + i != products.end(); i++) {
                string s = *(it + i);
                if (s.find(cur) == string::npos) {
                    break;
                }
                suggested.push_back(s);
            }
            result.push_back(suggested);
        }
        
        return result;
    }
};
//Runtime: 52 ms, faster than 76.19% of C++ online submissions for Search Suggestions System.
//Memory Usage: 30 MB, less than 60.36% of C++ online submissions for Search Suggestions System.
```


# refer

[[C++/Java/Python] Sort and Binary Search the Prefix](https://leetcode.com/problems/search-suggestions-system/discuss/436674/C%2B%2BJavaPython-Sort-and-Binary-Search-the-Prefix)