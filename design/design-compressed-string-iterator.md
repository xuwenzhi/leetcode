# design-compressed-string-iterator

[https://leetcode.com/problems/design-compressed-string-iterator/](https://leetcode.com/problems/design-compressed-string-iterator/)

```
Design and implement a data structure for a compressed string iterator. It should support the following operations: next and hasNext.

The given compressed string will be in the form of each letter followed by a positive integer representing the number of this letter existing in the original uncompressed string.

next() - if the original string still has uncompressed characters, return the next letter; Otherwise return a white space.
hasNext() - Judge whether there is any letter needs to be uncompressed.

Note:
Please remember to RESET your class variables declared in StringIterator, as static/class variables are persisted across multiple test cases. Please see here for more details.

Example:

StringIterator iterator = new StringIterator("L1e2t1C1o1d1e1");

iterator.next(); // return 'L'
iterator.next(); // return 'e'
iterator.next(); // return 'e'
iterator.next(); // return 't'
iterator.next(); // return 'C'
iterator.next(); // return 'o'
iterator.next(); // return 'd'
iterator.hasNext(); // return true
iterator.next(); // return 'e'
iterator.hasNext(); // return false
iterator.next(); // return ' '
```

# thinking

给出的压缩字符串遵循这样的规律，每个字母后面跟随一个数字，这个数字可能很大，比如这个case

```
["StringIterator","next","next","next","next","next","next","hasNext","next","hasNext"]
[["a1234567890b1234567890"],[],[],[],[],[],[],[],[],[]]
```

所以，我们不能把压缩串解压，否则会超内存。那么就想到可以存储每个字符的区间了，那么用什么存呢？思前想后，其实 **vector** 就可以解决问题

[
    ['a', 1234567890],
    ['b', 1234567890],
    ...
]

注意vector要声明为 **vector<vector<long>>** ,防止数值溢出。

# solution

```c++
class StringIterator {
private:
    vector<vector<long>> v;
    int index = 0;
public:
    StringIterator(string compressedString) {
        int start = 0;
        for (int i=0;i<compressedString.size();) {
            int c = compressedString[i];
            i += 1;
            long n = 0;
            while (isdigit(compressedString[i])) {
                n = n * 10 + (compressedString[i] - '0');
                i++;
            }
            start += n;
            v.push_back({c, start});
        }
    }
    
    char next() {
        if (hasNext()) {
            for (int i=0;i<v.size();i++) {
                if (index < v[i][1]) {
                    index++;
                    return v[i][0];
                }
            }
        }
        
        return ' ';
    }
    
    bool hasNext() {
        for (int i=0;i<v.size();i++) {
            if (i == v.size()-1 && index == v[i][1]) return false;
            if (index < v[i][1]) return true;
        }
        
        return false;
    }
    
    ~StringIterator() {
        v.clear();
        index = 0;
    }
};

/**
 * Your StringIterator object will be instantiated and called as such:
 * StringIterator* obj = new StringIterator(compressedString);
 * char param_1 = obj->next();
 * bool param_2 = obj->hasNext();
 */
 //Runtime: 16 ms, faster than 93.10% of C++ online submissions for Design Compressed String Iterator.
//Memory Usage: 13.5 MB, less than 49.00% of C++ online submissions for Design Compressed String Iterator.
```