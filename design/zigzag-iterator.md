# zigzag-iterator

[https://leetcode.com/problems/zigzag-iterator/](https://leetcode.com/problems/zigzag-iterator/)


```
Given two 1d vectors, implement an iterator to return their elements alternately.

Example:

Input:
v1 = [1,2]
v2 = [3,4,5,6]

Output: [1,3,2,4,5,6]

Explanation: By calling next repeatedly until hasNext returns false,
             the order of elements returned by next should be: [1,3,2,4,5,6].
Follow up: What if you are given k 1d vectors? How well can your code be extended to such cases?

Clarification for the follow up question:
The "Zigzag" order is not clearly defined and is ambiguous for k > 2 cases. If "Zigzag" does not look right to you, replace "Zigzag" with "Cyclic". For example:

Input:
[1,2,3]
[4,5,6,7]
[8,9]

Output: [1,4,8,2,5,9,3,6,7].
```

# solution


```c++
class ZigzagIterator {
private:
    vector<int> data{};
    int index = -1;
public:
    ZigzagIterator(vector<int>& v1, vector<int>& v2) {
        for (int i=0;true;i++) {
            if (v1.size() <= i && v2.size() <= i) break;
            if (i < v1.size()) data.push_back(v1[i]);
            if (i < v2.size()) data.push_back(v2[i]);
        }
    }

    int next() {
        return data[++index];
    }

    bool hasNext() {
        int size = data.size();
        return size > 0 && index < size-1;
    }
};

/**
 * Your ZigzagIterator object will be instantiated and called as such:
 * ZigzagIterator i(v1, v2);
 * while (i.hasNext()) cout << i.next();
 */
//Runtime: 20 ms, faster than 98.69% of C++ online submissions for Zigzag Iterator.
//Memory Usage: 10.2 MB, less than 31.03% of C++ online submissions for Zigzag Iterator.
```
