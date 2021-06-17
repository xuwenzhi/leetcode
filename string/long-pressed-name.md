# long-pressed-name

[https://leetcode.com/problems/long-pressed-name/](https://leetcode.com/problems/long-pressed-name/)


```
Your friend is typing his name into a keyboard. Sometimes, when typing a character c, the key might get long pressed, and the character will be typed 1 or more times.

You examine the typed characters of the keyboard. Return True if it is possible that it was your friends name, with some characters (possibly none) being long pressed.

 

Example 1:

Input: name = "alex", typed = "aaleex"
Output: true
Explanation: 'a' and 'e' in 'alex' were long pressed.
Example 2:

Input: name = "saeed", typed = "ssaaedd"
Output: false
Explanation: 'e' must have been pressed twice, but it wasn't in the typed output.
Example 3:

Input: name = "leelee", typed = "lleeelee"
Output: true
Example 4:

Input: name = "laiden", typed = "laiden"
Output: true
Explanation: It's not necessary to long press any character.
 

Constraints:

1 <= name.length <= 1000
1 <= typed.length <= 1000
name and typed contain only lowercase English letters.
```

# thinking


# solution

常规方法，就是使用两个指针来计算。

```c++
// O(m+n)
class Solution {
public:
    bool isLongPressedName(string name, string typed) {
        int nameLen = name.length(), typedLen = typed.length();
        int i = 0, j = 0;
        while (i < nameLen) {
            if (name[i] != typed[j]) {
                return false;
            }
            
            if ((i < nameLen - 1 && name[i] != name[i+1])
               || i == nameLen-1) {
                while (j < typedLen - 1 && typed[j] == typed[j+1]) {
                    j++;
                }
            }
            j++;
            i++;
        }
        
        return j == typed.length();
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Long Pressed Name.
//Memory Usage: 6.4 MB, less than 8.67% of C++ online submissions for Long Pressed Name.
```

# solution

这种方法是通过将 String 转化成一个map，比如 aaleex 可以转化为

```
a : 2
l : 1
e : 2
x : 1
```

从而比较 **name** 和 **typed** 两个数组。

```c++
class Solution {
public:
    vector<pair<char, int>> mappingCount(string title) {
         vector<pair<char, int>> result;
        int i = 0;
        while (i < title.length()) {
            int j = i+1;
            while (j < title.length() && title[j] == title[i]) {
                j++;
            }
            result.push_back(make_pair(title[i], j-i));
            i = j;
        }
        
        return result;
    }
    
    bool isLongPressedName(string name, string typed) {
        vector<pair<char, int>> v, y;
        
        v = mappingCount(name);
        y = mappingCount(typed);
        
        if (v.size() > y.size()) 
            return false;
        int i = 0;
        for (; i < v.size(); i++) {
            if (v[i].first != y[i].first || v[i].second > y[i].second) {
                return false;
            }
        }
        
        return i == y.size();
    }
};
//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Long Pressed Name.
//Memory Usage: 6.8 MB, less than 6.22% of C++ online submissions for Long Pressed Name.
```