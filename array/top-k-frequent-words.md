# top-k-frequent-words

[https://leetcode.com/problems/top-k-frequent-words/](https://leetcode.com/problems/top-k-frequent-words/)

```
Given a non-empty list of words, return the k most frequent elements.

Your answer should be sorted by frequency from highest to lowest. If two words have the same frequency, then the word with the lower alphabetical order comes first.

Example 1:

Input: ["i", "love", "leetcode", "i", "love", "coding"], k = 2
Output: ["i", "love"]
Explanation: "i" and "love" are the two most frequent words.
    Note that "i" comes before "love" due to a lower alphabetical order.
Example 2:

Input: ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], k = 4
Output: ["the", "is", "sunny", "day"]
Explanation: "the", "is", "sunny" and "day" are the four most frequent words,
    with the number of occurrence being 4, 3, 2 and 1 respectively.
Note:

You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
Input words contain only lowercase letters.
Follow up:

Try to solve it in O(n log k) time and O(n) extra space.
```
# thinking

这道题比之前那道[top-k-frequent-elements](https://github.com/xuwenzhi/leetcode/blob/master/array/top-k-frequent-elements.md)差不多，唯一的区别也是最让人恶心的是，case中如果存在相同频次的次，需要按照字典序排序。比如 case ["i", "love", "leetcode", "i", "love", "coding"], k = 2，结果必须是 ["i","love"]，不能乱序。

所以 **需要一个可以即能根据次数又能根据字母续排的compare**， 这里就选择了 **最小堆** 来解决。

出现次数最多，且字典序在前的出现在堆底，例如case ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"] k=4

遍历堆，是这样的顺序

```
day:1
sunny:2
is:3
the:4
```

# solution

```c++
struct classcomp {
    bool operator() (const std::pair<string,int> &a, const std::pair<string,int> &b) const {
        return a.second > b.second || (a.second == b.second && a.first < b.first);
  }
};

class Solution {
public:
    vector<string> topKFrequent(vector<string>& words, int k) {
        unordered_map<string,int> m;
        priority_queue<pair<string, int>,vector<pair<string, int>>, classcomp> q;
        
        for (int i=0;i<words.size();i++) {
            m[words[i]]++;
        }
        
        vector<string> res(k);
        for (auto i:m) {
            q.push(i);
            if (q.size() > k) {
                q.pop();
            }
        }
        
        for (int i=k-1;i>=0;i--) {
            res[i] = q.top().first;
            q.pop();
        }

        return res;
    }
};
//Runtime: 16 ms, faster than 94.61% of C++ online submissions for Top K Frequent Words.
//Memory Usage: 11.4 MB, less than 78.32% of C++ online submissions for Top K Frequent Words.
```