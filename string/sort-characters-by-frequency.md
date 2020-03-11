# sort-characters-by-frequency

[https://leetcode.com/problems/sort-characters-by-frequency/](https://leetcode.com/problems/sort-characters-by-frequency/)

```
Given a string, sort it in decreasing order based on the frequency of characters.

Example 1:

Input:
"tree"

Output:
"eert"

Explanation:
'e' appears twice while 'r' and 't' both appear once.
So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
Example 2:

Input:
"cccaaa"

Output:
"cccaaa"

Explanation:
Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
Note that "cacaca" is incorrect, as the same characters must be together.
Example 3:

Input:
"Aabb"

Output:
"bbAa"

Explanation:
"bbaA" is also a valid answer, but "Aabb" is incorrect.
Note that 'A' and 'a' are treated as two different characters.
```

# thinking

直接统计字母出现的频率，然后放在一个priority_queue里做好排序函数，即可了.

```c++
class Solution {
public:
    string frequencySort(string s) {
        auto comp = [](const auto a, const auto b) {
            return a.second < b.second;
        };
        priority_queue<pair<char, int>, vector<pair<char,int>>, decltype(comp)> pq(comp);
        unordered_map<char, int> m;

        for (auto c:s) {
            m[c]++;
        }
        for (auto c:m) {
            pq.push(c);
        }

        string res = "";
        while (!pq.empty()) {
            res += string(pq.top().second, pq.top().first);
            pq.pop();
        }

        return res;
    }
};
//Runtime: 16 ms, faster than 76.74% of C++ online submissions for Sort Characters By Frequency.
//Memory Usage: 10.3 MB, less than 94.12% of C++ online submissions for Sort Characters By Frequency.
```


# solution (hashtable + multimap)

后来想到这个就很类似 [[Medium]top-k-frequent-elements - top-k个高频数字](https://github.com/xuwenzhi/leetcode/blob/master/array/top-k-frequent-elements.md)和[[Medium]top-k-frequent-words - top-k个高频词](https://github.com/xuwenzhi/leetcode/blob/master/array/top-k-frequent-words.md)，那么直接用 **multimap** 解决就完事了。

```c++
class Solution {
public:
    string frequencySort(string s) {
        unordered_map<char, int> m;
        for (auto c : s) {
            m[c]++;
        }

        multimap<int, char> mmap;
        for (auto p : m) {
            mmap.insert(make_pair(p.second, p.first));
        }

        string res;
        for (auto p : mmap) {
            res = string(p.first, p.second) + res;
        }

        return res;
    }
};
//Runtime: 16 ms, faster than 76.74% of C++ online submissions for Sort Characters By Frequency.
//Memory Usage: 10.9 MB, less than 70.59% of C++ online submissions for Sort Characters By Frequency.
```
