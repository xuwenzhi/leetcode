# camelcase-matching

[https://leetcode.com/problems/camelcase-matching/](https://leetcode.com/problems/camelcase-matching/)

```
A query word matches a given pattern if we can insert lowercase letters to the pattern word so that it equals the query. (We may insert each character at any position, and may insert 0 characters.)

Given a list of queries, and a pattern, return an answer list of booleans, where answer[i] is true if and only if queries[i] matches the pattern.

 

Example 1:

```
```
Input: queries = ["FooBar","FooBarTest","FootBall","FrameBuffer","ForceFeedBack"], pattern = "FB"
Output: [true,false,true,true,false]
Explanation: 
"FooBar" can be generated like this "F" + "oo" + "B" + "ar".
"FootBall" can be generated like this "F" + "oot" + "B" + "all".
"FrameBuffer" can be generated like this "F" + "rame" + "B" + "uffer".
Example 2:
```
```
Input: queries = ["FooBar","FooBarTest","FootBall","FrameBuffer","ForceFeedBack"], pattern = "FoBa"
Output: [true,false,true,false,false]
Explanation: 
"FooBar" can be generated like this "Fo" + "o" + "Ba" + "r".
"FootBall" can be generated like this "Fo" + "ot" + "Ba" + "ll".
Example 3:
```
```
Input: queries = ["FooBar","FooBarTest","FootBall","FrameBuffer","ForceFeedBack"], pattern = "FoBaT"
Output: [false,true,false,false,false]
Explanation: 
"FooBarTest" can be generated like this "Fo" + "o" + "Ba" + "r" + "T" + "est".
```
```
Note:

1 <= queries.length <= 100
1 <= queries[i].length <= 100
1 <= pattern.length <= 100
All strings consists only of lower and upper case English letters.
```

# thinking

这个题竟然还有提示，而且提示竟然是让dp做，这不是开玩笑呢吗~必须吐槽+踩~

做这道题的时候还需要注意一个场景，就是有这种case 

```
["ControlPanel"]
"CooP"
// true
```
所以要注意pattern的小写序列在query中并不一定是连续的，所以使用两个指针，分别标记在query和pattern处进行判断即可了。

最后为什么要返回 i == p.length()，如果是true的case的情况，在遍历完成之后，i也应刚好到pattern的末尾才对，但是pattern的匹配规则可能会比query长，例如下面这种case.

```
["TestCase"]
"TeCaB"
```

# solution (2 pointer)

```c++
class Solution {
public:
    bool isMatch(string& s, string& p) {
        int i=0;
        for (auto &c : s) {
            if (i < p.length() && c == p[i]) i++;
            else if (c  < 'a') return false;
        }
        
        return i == p.length();
    }
        
    vector<bool> camelMatch(vector<string>& queries, string pattern) {
        vector<bool> res;
        for (int i=0;i<queries.size();i++) {
            res.push_back(isMatch(queries[i], pattern));
        }
        
        return res;
    }
};
```