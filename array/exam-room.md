# exam-room

[https://leetcode.com/problems/exam-room/](https://leetcode.com/problems/exam-room/)

```
In an exam room, there are N seats in a single row, numbered 0, 1, 2, ..., N-1.

When a student enters the room, they must sit in the seat that maximizes the distance to the closest person.  If there are multiple such seats, they sit in the seat with the lowest number.  (Also, if no one is in the room, then the student sits at seat number 0.)

Return a class ExamRoom(int N) that exposes two functions: ExamRoom.seat() returning an int representing what seat the student sat in, and ExamRoom.leave(int p) representing that the student in seat number p now leaves the room.  It is guaranteed that any calls to ExamRoom.leave(p) have a student sitting in seat p.

 

Example 1:

Input: ["ExamRoom","seat","seat","seat","seat","leave","seat"], [[10],[],[],[],[],[4],[]]
Output: [null,0,9,4,2,null,5]
Explanation:
ExamRoom(10) -> null
seat() -> 0, no one is in the room, then the student sits at seat number 0.
seat() -> 9, the student sits at the last seat number 9.
seat() -> 4, the student sits at the last seat number 4.
seat() -> 2, the student sits at the last seat number 2.
leave(4) -> null
seat() -> 5, the student sits at the last seat number 5.
​​​​​​​

Note:

1 <= N <= 10^9
ExamRoom.seat() and ExamRoom.leave() will be called at most 10^4 times across all test cases.
Calls to ExamRoom.leave(p) are guaranteed to have a student currently sitting in seat number p.
```

# thinking

这道题是 [maximize-distance-to-closest-person](https://github.com/xuwenzhi/leetcode/blob/master/array/maximize-distance-to-closest-person.md) 的设计版，基本实现也差不多。

# solution (map)

这个方案是采用 map 来存储已坐好位置的下标，由于 map 会自动排好序，这是使用vector所没有的优势，其实使用set也是可以的，下面有个set的解决方案。

```c++
class ExamRoom {
private:
    map<int,int> m;
    int len;
public:
    ExamRoom(int N) {
        len = N;
    }
    
    int seat() {
        int pos = 0;
        if (m.empty()) {
            m.insert({0,0});
        } else {
            int distance=(m.begin())->first - 0;
            auto it = m.begin();
            it++;
            int r = 0;
            for (;it!=m.end();it++) {
                int tmp = (it->first - prev(it,1)->first)/2;
                if (distance < tmp) {
                    distance = tmp;
                    pos = prev(it,1)->first+tmp;
                }
                r = it->first;
            }
            int right = len - 1 - r;
            if (right > distance) {
                distance = right;
                pos = len-1;
            }

            m.insert({pos, pos});
        }
        return pos;
    }
    
    void leave(int p) {
        m.erase(p);
    }
};

/**
 * Your ExamRoom object will be instantiated and called as such:
 * ExamRoom* obj = new ExamRoom(N);
 * int param_1 = obj->seat();
 * obj->leave(p);
 */
//Runtime: 44 ms, faster than 38.29% of C++ online submissions for Exam Room.
//Memory Usage: 14.1 MB, less than 50.22% of C++ online submissions for Exam Room.
```

# solution (set)

很明显，set 的方案会比 map 更加节省内存。

```c++
class ExamRoom {
private:
    set<int> m;
    int len;
public:
    ExamRoom(int N) {
        len = N;
    }
    
    int seat() {
        int pos = 0;
        if (m.empty()) {
            m.insert(0);
        } else {
            int distance=*(m.begin()) - 0;
            auto it = m.begin();
            it++;
            int r = 0;
            for (;it!=m.end();it++) {
                int tmp = (*(it) - *prev(it,1))/2;
                if (distance < tmp) {
                    distance = tmp;
                    pos = *prev(it,1)+tmp;
                }
                r = *it;
            }
            int right = len - 1 - r;
            if (right > distance) {
                distance = right;
                pos = len-1;
            }

            m.insert(pos);
        }
        return pos;
    }
    
    void leave(int p) {
        m.erase(p);
    }
};

/**
 * Your ExamRoom object will be instantiated and called as such:
 * ExamRoom* obj = new ExamRoom(N);
 * int param_1 = obj->seat();
 * obj->leave(p);
 */
//Runtime: 44 ms, faster than 38.29% of C++ online submissions for Exam Room.
//Memory Usage: 13.9 MB, less than 71.46% of C++ online submissions for Exam Room.
```