# letter-tile-possibilities

[https://leetcode.com/problems/letter-tile-possibilities/](https://leetcode.com/problems/letter-tile-possibilities/)

```
You have a set of tiles, where each tile has one letter tiles[i] printed on it.  Return the number of possible non-empty sequences of letters you can make.

 

Example 1:

Input: "AAB"
Output: 8
Explanation: The possible sequences are "A", "B", "AA", "AB", "BA", "AAB", "ABA", "BAA".
Example 2:

Input: "AAABBC"
Output: 188
 

Note:

1 <= tiles.length <= 7
tiles consists of uppercase English letters.
```

# solution (hash table)

### 基本思想
假如存在字符串 **AA**，那么新插入一个B，那么有三种结果依次是  **BAA，ABA，AAB**。

依次遍历 **tiles**，每次都将得到一个字符 **c**，然后遍历 Hashtable中每一个字符串，然后再将生成的新字符串再插入到Hashtable里。

### Note

1. 不能一边生成新字符串就直接插入Hashtable，要先保存在一个临时容器里，最后在插入到Hashtable

2. 没遍历到一个字符 **c** 时，要在最后将 **c** 插入到Hashtable里。

```c++
class Solution {
public:
    int numTilePossibilities(string tiles) {
        unordered_map<string, bool> m;
        for (char c:tiles) {
            vector<string> v;
            for (auto mm:m) {
                string base = mm.first;
                for (int i=0;i<base.length();i++) {
                    string tmp = base.substr(0, i) + c + base.substr(i);
                    v.push_back(tmp);
                }
                v.push_back(base + c);
            }
            for (auto s: v) {
                m[s] = true;
            }
            m[string(1, c)] = true;
        }
        
        
        return m.size();
    }
};
//Runtime: 40 ms, faster than 45.76% of C++ online submissions for Letter Tile Possibilities.
//Memory Usage: 30.3 MB, less than 100.00% of C++ online submissions for Letter Tile Possibilities.
```

# solution (dfs)

```c++
class Solution {
public:
    int numTilePossibilities(string tiles) {
        int count[26] = {0};
        for (char c :tiles) count[c-'A']++;
        
        return dfs(count);
    }
    
    int dfs(int* count) {
        int sum = 0;
        for (int i=0;i<26;i++) {
            if (count[i] == 0) continue;
            count[i]--;
            sum++;
            sum += dfs(count);
            count[i]++;
        }
        return sum;
    }
};
//Runtime: 8 ms, faster than 72.12% of C++ online submissions for Letter Tile Possibilities.
//Memory Usage: 8.1 MB, less than 100.00% of C++ online submissions for Letter Tile Possibilities.
```

# refer

[Concise java solution](https://leetcode.com/problems/letter-tile-possibilities/discuss/308284/)