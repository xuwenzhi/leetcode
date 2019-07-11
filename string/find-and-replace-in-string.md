# find-and-replace-in-string

[https://leetcode.com/problems/find-and-replace-in-string/](https://leetcode.com/problems/find-and-replace-in-string/)

```
To some string S, we will perform some replacement operations that replace groups of letters with new ones (not necessarily the same size).

Each replacement operation has 3 parameters: a starting index i, a source word x and a target word y.  The rule is that if x starts at position i in the original string S, then we will replace that occurrence of x with y.  If not, we do nothing.

For example, if we have S = "abcd" and we have some replacement operation i = 2, x = "cd", y = "ffff", then because "cd" starts at position 2 in the original string S, we will replace it with "ffff".

Using another example on S = "abcd", if we have both the replacement operation i = 0, x = "ab", y = "eee", as well as another replacement operation i = 2, x = "ec", y = "ffff", this second operation does nothing because in the original string S[2] = 'c', which doesn't match x[0] = 'e'.

All these operations occur simultaneously.  It's guaranteed that there won't be any overlap in replacement: for example, S = "abc", indexes = [0, 1], sources = ["ab","bc"] is not a valid test case.

Example 1:

Input: S = "abcd", indexes = [0,2], sources = ["a","cd"], targets = ["eee","ffff"]
Output: "eeebffff"
Explanation: "a" starts at index 0 in S, so it's replaced by "eee".
"cd" starts at index 2 in S, so it's replaced by "ffff".
Example 2:

Input: S = "abcd", indexes = [0,2], sources = ["ab","ec"], targets = ["eee","ffff"]
Output: "eeecd"
Explanation: "ab" starts at index 0 in S, so it's replaced by "eee". 
"ec" doesn't starts at index 2 in the original S, so we do nothing.
Notes:

0 <= indexes.length = sources.length = targets.length <= 100
0 < indexes[i] < S.length <= 1000
All characters in given inputs are lowercase letters.
```

# thinking

最开始是想使用一个 **res** 存储结果，遍历indexes，然后拼接出res即可了，**S** 保持不变化，这样就能够根据给定的 indexes 快速索引到 S的位置，不过后来发现还有这样的case

```
"vmokgggqzp"
[3,5,1]
["kg","ggq","mo"]
["s","so","bfr"]
```
也就是，后面出现的 1 实际上是比3小的（ **其实也可以先对indexes排序，不过相应的sources和targets对应的位置也需要跟着变，比较麻烦。** ） 。

所以就变换了思路，直接操作S走起，不过直接操作同样有个问题，就是如果前面进行过了替换，那么indexes的索引也得跟着变，不然索引就不起作用了。

### 具体的替换方法

当前面发生了变化，那么后面索引值比当前 indexes[i] 大的就需要进行 **indexes[k] += targets[i].length() - sources[i].length()** 这样的变化，而比 indexes[i] 小的就不用变化了，然后依次遍历解决问题就好了。

### 注意这里判断字符串是否匹配这里

加入此时sources[i]是个很长的字符串并且超过S.length()的时候，可以发现，并没有判断 **j+start** 是否越界的情况，因为当运行到 S.length() 的情况时 S[j+start] == '\0'，这时候判断，必然不相等，所以就退出了。

```c++
for (;j<sources[i].size();j++) {
    if (sources[i][j] != S[j+start]) {
        break;
    }
}
```

# solution 

```c++
class Solution {
public:
    string findReplaceString(string S, vector<int>& indexes, vector<string>& sources, vector<string>& targets) {
        int l = indexes.size();
        if (l == 0) return S;
        int start = 0, end = 0;
        for (int i=0;i<l;i++) {
            start = indexes[i];
            int j = 0;
            for (;j<sources[i].size();j++) {
                if (sources[i][j] != S[j+start]) {
                    break;
                }
            }
            // match
            if (j == sources[i].size()) {
                S = S.substr(0, start) + targets[i] + S.substr(start + sources[i].length());
                for (int k = i+1;k<indexes.size();k++) {
                    if (indexes[k] > indexes[i]) {
                        indexes[k] += targets[i].length() - sources[i].length();
                    }
                }
            }
        }
        
        return S;
    }
};
//Runtime: 8 ms, faster than 69.45% of C++ online submissions for Find And Replace in String.
//Memory Usage: 12.3 MB, less than 18.21% of C++ online submissions for Find And Replace in String.
```



# solution (right to left)

后来看到评论区，还有排序后从后向左的解法，这样其实就避开了从左向右导致原始索引发生变化了。

这种是构造一个vector<pair<int,int>>，并且这个pair是这样的，{indexes[i], i}，这样对其排序的话就会按照indexes[i] 进行排序，也就达到了我们的效果。

```c++
class Solution {
public:
    string findReplaceString(string S, vector<int>& indexes, vector<string>& sources, vector<string>& targets) {
        
        vector<pair<int,int>> sorted;
        for (int i=0;i<indexes.size();i++) {
            sorted.push_back(make_pair(indexes[i], i));
        }
        
        sort(sorted.rbegin(), sorted.rend());
        for (auto idx : sorted) {
            string s = sources[idx.second];
            if (S.substr(idx.first, s.length()) == s) 
                S = S.substr(0, idx.first) + targets[idx.second] + S.substr(idx.first+s.length());
        }
        
        return S;
    }
};
//Runtime: 8 ms, faster than 69.45% of C++ online submissions for Find And Replace in String.
//Memory Usage: 12.6 MB, less than 9.25% of C++ online submissions for Find And Replace in String.
```

# refer

[[C++/Java/Python] Replace S from right to left](https://leetcode.com/problems/find-and-replace-in-string/discuss/130587/C%2B%2BJavaPython-Replace-S-from-right-to-left)