# uncommon-words-from-two-sentences

[https://leetcode.com/problems/uncommon-words-from-two-sentences/](https://leetcode.com/problems/uncommon-words-from-two-sentences/)

```
We are given two sentences A and B.  (A sentence is a string of space separated words.  Each word consists only of lowercase letters.)

A word is uncommon if it appears exactly once in one of the sentences, and does not appear in the other sentence.

Return a list of all uncommon words. 

You may return the list in any order.

 

Example 1:

Input: A = "this apple is sweet", B = "this apple is sour"
Output: ["sweet","sour"]
Example 2:

Input: A = "apple apple", B = "banana"
Output: ["banana"]
 

Note:

0 <= A.length <= 200
0 <= B.length <= 200
A and B both contain only spaces and lowercase letters.
```

# thinking

一开始没认真读题，我以为这道题是统计两个句子中不一样的单词，但是这个case有点说不通了

```
Input: A = "apple apple", B = "banana"
Output: ["banana"]
```

题目中对uncommon做了定义，如果一个单词在一个句子中仅出现一次，并且在另外一个句子中没有出现才算做 uncommon哈。

所以实现起来也比较简单了。


# solution (hashtable)

```c++
class Solution {
public:
    vector<string> uncommonFromSentences(string A, string B) {
        vector<string> res;
        string word;
        unordered_map<string,int> m;
        stringstream issa(A);
        stringstream issb(B);
        
        while (issa >> word) 
            m[word]++;
        while (issb >> word) {
            m[word]++;
        }
        
        for (auto i:m) {
            if (i.second == 1) 
                res.push_back(i.first);
        }
        
        return res;
    }
};
//Runtime: 4 ms, faster than 85.57% of C++ online submissions for Uncommon Words from Two Sentences.
//Memory Usage: 8.8 MB, less than 86.32% of C++ online submissions for Uncommon Words from Two Sentences.
```


# points

## how to split words from a sentence (def)

### stringstream

```c
vector<string> printWords(string str) 
{ 
    // word variable to store word 
    string word; 
  
    // making a string stream 
    stringstream iss(str); 
  
    vector<string> res;
    // Read and print each word. 
    while (iss >> word) 
        res.push_back(word);
        
    return res;
} 
```

### strtok

```
vector<string> split(str) {
    vector<string> res;
    // Returns first token  
    char *token = strtok(str, " "); 
   
    // Keep printing tokens while one of the 
    // delimiters present in str[]. 
    while (token != NULL) 
    { 
        res.push_back(token);
        token = strtok(NULL, " "); 
    } 

    return res;
}
```

### getline

```
std::vector<std::string> split(const std::string& s, char delimiter)
{
   std::vector<std::string> tokens;
   std::string token;
   std::istringstream tokenStream(s);
   while (std::getline(tokenStream, token, delimiter))
   {
      tokens.push_back(token);
   }
   return tokens;
}
```

### boost

```
#include <boost/algorithm/string.hpp>
 
std::string text = "Let me split this into words";
std::vector<std::string> results;
 
boost::split(results, text, [](char c){return c == ' ';});
```

# refer 

[split a sentence into words in cpp](https://www.geeksforgeeks.org/split-a-sentence-into-words-in-cpp/)

[How to split a string in c++](https://www.fluentcpp.com/2017/04/21/how-to-split-a-string-in-c/)