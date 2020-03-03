# find-all-anagrams-in-a-string

[https://leetcode.com/problems/find-all-anagrams-in-a-string/](https://leetcode.com/problems/find-all-anagrams-in-a-string/)

```
Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.

Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.

The order of output does not matter.

Example 1:

Input:
s: "cbaebabacd" p: "abc"

Output:
[0, 6]

Explanation:
The substring with start index = 0 is "cba", which is an anagram of "abc".
The substring with start index = 6 is "bac", which is an anagram of "abc".
Example 2:

Input:
s: "abab" p: "ab"

Output:
[0, 1, 2]

Explanation:
The substring with start index = 0 is "ab", which is an anagram of "ab".
The substring with start index = 1 is "ba", which is an anagram of "ab".
The substring with start index = 2 is "ab", which is an anagram of "ab".
```

# solution (HashTable)

使用hashtable保存**p**中字符的出现以及出现的次数，然后再依次遍历**s**，类似于滑动窗口的检查就好了。不过这里面使用了HashTable的判等，有个地方需要注意。

不过下面那个方案更加检点点，因为字符串中只存在小写字母，故直接弃用hashtable，使用vector

```c++
class Solution {
public:
    vector<int> findAnagrams(string s, string p) {
        vector<int> res{};
        int len = p.size();
        int sLen = s.size();
        if (len > sLen) return res;
        unordered_map<char,int> mapP, mapS;
        for (char a : p) {
            mapP[a]++;
        }

        for (int i=0;i<sLen;i++) {
            if (i >= len) {
				// 如果不存在key，则干掉，如果存在并且value>1，只需要--，不然会影响判等
                if (mapS[s[i-len]] > 1)
                    mapS[s[i-len]]--;
                else
                    mapS.erase(s[i-len]);
            }

            mapS[s[i]]++;
			// 比较这两个hash
            if (mapS == mapP) res.push_back(i - len + 1);
        }

        return res;
    }
};
//Runtime: 84 ms, faster than 20.13% of C++ online submissions for Find All Anagrams in a String.
//Memory Usage: 14.5 MB, less than 16.82% of C++ online submissions for Find All Anagrams in a String.
```


# solution (vector<int>)

```c++
class Solution {
public:
    vector<int> findAnagrams(string s, string p) {
        vector<int> res{};
        int len = p.size();
        int sLen = s.size();
        if (len > sLen) return res;
        vector<int> mapP(26,0), mapS(26,0);
        for (char a : p) {
            mapP[a-'a']++;
        }

        for (int i=0;i<sLen;i++) {
            if (i >= len) mapS[s[i-len]-'a']--;

            mapS[s[i]-'a']++;

            if (mapS == mapP) res.push_back(i - len + 1);
        }

        return res;
    }
};
//Runtime: 36 ms, faster than 74.42% of C++ online submissions for Find All Anagrams in a String.
//Memory Usage: 10.5 MB, less than 82.27% of C++ online submissions for Find All Anagrams in a String.
```
