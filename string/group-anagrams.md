# group-anagrams

[https://leetcode.com/problems/group-anagrams/](https://leetcode.com/problems/group-anagrams/)

```
Given an array of strings, group anagrams together.

Example:

Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
Output:
[
  ["ate","eat","tea"],
  ["nat","tan"],
  ["bat"]
]
Note:

All inputs will be in lowercase.
The order of your output does not matter.
```

# solution

这个解决方案和[[Easy]find-all-anagrams-in-a-string - 找到所有乱序字符串](https://github.com/xuwenzhi/leetcode/blob/master/string/find-all-anagrams-in-a-string.md)解决方案类似，是把每一个字符串都得到计算后的map，然后再比较组合。

```c++
class Solution {
public:
    vector<vector<string>> groupAnagrams(vector<string>& strs) {
        int l = strs.size();
        vector<vector<string>> res{};

        map<vector<int>, int> map{};
        for (int i=0;i<l;i++) {
            vector<int> slide(26, 0);
            for (int j=0;j<strs[i].size();j++) {
                slide[strs[i][j]-'a']++;
            }

            if (map.find(slide) != map.end()) {
                res[map[slide]].push_back(strs[i]);
            } else {
                res.push_back({strs[i]});
                map.insert(std::make_pair(slide, res.size()-1));
            }
        }

        return res;
    }
};
//Runtime: 60 ms, faster than 38.24% of C++ online submissions for Group Anagrams.
//Memory Usage: 24 MB, less than 14.81% of C++ online submissions for Group Anagrams.
```

# solution (sort)

这个题还可以通过排序每一个字符串来解决，不过这里有个小tricky，由于字符串中仅有小写字母，所以通过counter的方式来排序了，这样排序就是线性时间了.

```c++
class Solution {
private:
    string strSort(string s) {
        int counter[26] = {0};
        for (char c : s) {
            counter[c-'a']++;
        }

        string res;
        for (int i=0;i<26;i++) {
            if (counter[i] > 0) {
                res += string(counter[i], i+'a');
            }
        }

        return res;
    }
public:
    vector<vector<string>> groupAnagrams(vector<string>& strs) {
        int l = strs.size();
        vector<vector<string>> res{};
        unordered_map<string, vector<string>> map{};

        for (int i=0;i<l;i++) {
            map[strSort(strs[i])].push_back(strs[i]);
        }

        for (auto i : map) {
            res.push_back(i.second);
        }

        return res;
    }
};
//Runtime: 40 ms, faster than 97.60% of C++ online submissions for Group Anagrams.
//Memory Usage: 20 MB, less than 59.24% of C++ online submissions for Group Anagrams.
```
