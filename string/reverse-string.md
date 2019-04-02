# reverse-string

[https://leetcode.com/problems/reverse-string/](https://leetcode.com/problems/reverse-string/)

# thinking

这个没啥可说的了，从头到中间位置，互相换下位置即可了.

# solution

```c++
class Solution {
public:
    void reverseString(vector<char>& s) {
        int len = s.size();
        if (len == 0) return;
        char c;
        for (int i = 0; i < s.size() / 2; i++) {
            c = s[i];
            s[i] = s[len-1-i];
            s[len-1-i] = c;
        }
    }
};
```
Success

Details

Runtime: 64 ms, faster than 44.76% of C++ online submissions for Reverse String.

Memory Usage: 15.2 MB, less than 99.05% of C++ online submissions for Reverse String.


# solution 2

相对来说，更加简单的写法，不过时间上没啥差别.

```
class Solution {
public:
    void reverseString(vector<char>& s) {
        int i = 0, j = s.size() - 1;
        while(i < j){
            swap(s[i++], s[j--]);
        }
    }
};
```


# solution 3

还有更简单的，使用到了**STL**

```
class Solution {
public:
    void reverseString(vector<char>& s) {
        return string(s.rbegin(), s.rend());
    }
};
```
