# two-sum-iii-data-structure-design

[https://leetcode.com/problems/two-sum-iii-data-structure-design/](https://leetcode.com/problems/two-sum-iii-data-structure-design/)

```
Design and implement a TwoSum class. It should support the following operations: add and find.

add - Add the number to an internal data structure.
find - Find if there exists any pair of numbers which sum is equal to the value.

Example 1:

add(1); add(3); add(5);
find(4) -> true
find(7) -> false
Example 2:

add(3); add(1); add(2);
find(3) -> true
find(6) -> false
```
# thinking

使用map存储变量，key为变量，value为变量出现的次数.同时是为了避免一些比较恶心的case.

case1: add 5, find 10
case2: add 0, find 0

# solution

```c++
class TwoSum {
private:
    unordered_map<int,int> map;
public:
    /** Initialize your data structure here. */
    TwoSum() {

    }

    /** Add the number to an internal data structure.. */
    void add(int number) {
        ++map[number];
    }

    /** Find if there exists any pair of numbers which sum is equal to the value. */
    bool find(int value) {
        for (auto a : map) {
            int t = value - a.first;
            if ((t != a.first && map.count(t))
                || (t == a.first && a.second > 1)) {
                return true;
            }
        }
        return false;
    }
};

/**
 * Your TwoSum object will be instantiated and called as such:
 * TwoSum* obj = new TwoSum();
 * obj->add(number);
 * bool param_2 = obj->find(value);
 */
//Runtime: 124 ms, faster than 91.18% of C++ online submissions for Two Sum III - Data structure design.
//Memory Usage: 23.7 MB, less than 85.71% of C++ online submissions for Two Sum III - Data structure design.
```
