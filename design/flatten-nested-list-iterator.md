# flatten-nested-list-iterator

[https://leetcode.com/problems/flatten-nested-list-iterator/](https://leetcode.com/problems/flatten-nested-list-iterator/)

```
Given a nested list of integers, implement an iterator to flatten it.

Each element is either an integer, or a list -- whose elements may also be integers or other lists.

Example 1:

Input: [[1,1],2,[1,1]]
Output: [1,1,2,1,1]
Explanation: By calling next repeatedly until hasNext returns false,
             the order of elements returned by next should be: [1,1,2,1,1].
Example 2:

Input: [1,[4,[6]]]
Output: [1,4,6]
Explanation: By calling next repeatedly until hasNext returns false,
             the order of elements returned by next should be: [1,4,6].
```

# thinking

因为还是个迭代器，还是想着在构造的时候直接处理成数组就行了，又因为元素既有数字又可能有列表，所以使用了递归去生成节点。

Notice:列表可能会存在较深的嵌套.

# solution

```c++
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *   public:
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     bool isInteger() const;
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     int getInteger() const;
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     const vector<NestedInteger> &getList() const;
 * };
 */
class NestedIterator {
public:
    vector<int> vec{};
    int index = -1;
    NestedIterator(vector<NestedInteger> &nestedList) {
        flatten(nestedList, 0);
    }

    void flatten(vector<NestedInteger> &nestedList, int i) {
        for (; i < nestedList.size(); i++) {
            if (nestedList[i].isInteger()) {
                this->vec.push_back(nestedList[i].getInteger());
            } else {
                flatten(nestedList[i].getList(), 0);
            }
        }
    }

    int next() {
        return this->vec[++this->index];
    }

    bool hasNext() {
        return (this->index + 1) < this->vec.size();
    }
};

/**
 * Your NestedIterator object will be instantiated and called as such:
 * NestedIterator i(nestedList);
 * while (i.hasNext()) cout << i.next();
 */
```

Runtime: 20 ms, faster than 100.00% of C++ online submissions for Flatten Nested List Iterator.

Memory Usage: 16.1 MB, less than 75.44% of C++ online submissions for Flatten Nested List Iterator.
