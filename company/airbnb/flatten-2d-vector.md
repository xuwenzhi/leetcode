# flatten-2d-vector

[https://leetcode.com/problems/flatten-2d-vector/](https://leetcode.com/problems/flatten-2d-vector/)

```
Design and implement an iterator to flatten a 2d vector. It should support the following operations: next and hasNext.



Example:

Vector2D iterator = new Vector2D([[1,2],[3],[4]]);

iterator.next(); // return 1
iterator.next(); // return 2
iterator.next(); // return 3
iterator.hasNext(); // return true
iterator.hasNext(); // return true
iterator.next(); // return 4
iterator.hasNext(); // return false


Notes:

Please remember to RESET your class variables declared in Vector2D, as static/class variables are persisted across multiple test cases. Please see here for more details.
You may assume that next() call will always be valid, that is, there will be at least a next element in the 2d vector when next() is called.


Follow up:

As an added challenge, try to code it using only iterators in C++ or iterators in Java.
```

# solution

打平二维数组，保存在一维中，处理就好了.

```c++
class Vector2D {
private:
    vector<int> data{};
    int index = -1;
public:
    Vector2D(vector<vector<int>>& v) {
        for (int i=0;i<v.size();i++) {
            for (int j=0;j<v[i].size();j++) {
                data.push_back(v[i][j]);
            }
        }
    }

    int next() {
        if (1 + index < data.size())
            return data[++index];
        return -1;
    }

    bool hasNext() {
        int size = data.size();
        return size > 0 && index < size-1;
    }
};

/**
 * Your Vector2D object will be instantiated and called as such:
 * Vector2D* obj = new Vector2D(v);
 * int param_1 = obj->next();
 * bool param_2 = obj->hasNext();
 */
//Runtime: 56 ms, faster than 98.83% of C++ online submissions for Flatten 2D Vector.
//Memory Usage: 23 MB, less than 71.43% of C++ online submissions for Flatten 2D Vector.
```
