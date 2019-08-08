# insert-delete-getrandom-o1-duplicates-allowed

[https://leetcode.com/problems/insert-delete-getrandom-o1-duplicates-allowed/](https://leetcode.com/problems/insert-delete-getrandom-o1-duplicates-allowed/)

```
Design a data structure that supports all following operations in average O(1) time.

Note: Duplicate elements are allowed.
insert(val): Inserts an item val to the collection.
remove(val): Removes an item val from the collection if present.
getRandom: Returns a random element from current collection of elements. The probability of each element being returned is linearly related to the number of same value the collection contains.
Example:

// Init an empty collection.
RandomizedCollection collection = new RandomizedCollection();

// Inserts 1 to the collection. Returns true as the collection did not contain 1.
collection.insert(1);

// Inserts another 1 to the collection. Returns false as the collection contained 1. Collection now contains [1,1].
collection.insert(1);

// Inserts 2 to the collection, returns true. Collection now contains [1,1,2].
collection.insert(2);

// getRandom should return 1 with the probability 2/3, and returns 2 with the probability 1/3.
collection.getRandom();

// Removes 1 from the collection, returns true. Collection now contains [1,2].
collection.remove(1);

// getRandom should return 1 and 2 both equally likely.
collection.getRandom();
```

# thinking

和上一题[[Medium]insert-delete-getrandom-o1 - O(1)级别的插入、删除及随机操作](https://github.com/xuwenzhi/leetcode/blob/master/design/insert-delete-getrandom-o1.md)是一个套路，不过这里允许了重复，那么就就在原来HashTable只存储一个下标，改为可以存储多个就可以了，那么选择什么结构呢？

#### unordered_map<int, vector<int>>

最开始我选择了最简单的vector<int>，但是经过了几个case之后失败了，失败原因是什么呢？看一个case，假如
```
nums = [10,10,20,20,30,30]
m[10] = {0,1}
m[20] = {2,3}
m[30] = {4,5}
```
下面依次执行相应操作:

remove 10
```
nums = [10,30, 20,20,30];
m[10] = {0}
m[20] = {2,3}
m[30] = {4,1}
```
remove 10
```
nums = [30,30,20,20];
m[10] = {}
m[20] = {2,3}
m[30] = {4,0}
```

**Note**: 理论上30对应的下标应该为 [0,1]才对，由于我在HashTable中存储的key是 **顺序存储** 的，而且在移除时，也是按照从最大的位置开始踢出（即上面移除的是下标为1的1，而不是下标为0的1），为了维持这种顺序，所以就 **需要一种能够对下标排序的数据结构**。

#### unordered_map<int, priority_queue<int, vector<int>>>

使用优先队列就可以完美解决我的问题了，由于C++中的priority_queue底层默认为最大堆，所以不需要指定了。


# solution

```c++
class RandomizedCollection {
public:
    /** Initialize your data structure here. */
    RandomizedCollection() {
        
    }
    
    /** Inserts a value to the collection. Returns true if the collection did not already contain the specified element. */
    bool insert(int val) {
        auto it = m.find(val);
        nums.emplace_back(val);
        if (it == m.end()) {
            m[val] = {};
        }
        m[val].push(nums.size()-1);
        
        if (it == m.end()) 
            return true;
        return false;
    }
    
    /** Removes a value from the collection. Returns true if the collection contained the specified element. */
    bool remove(int val) {
        if (m.find(val) == m.end() || m[val].empty()) {
            return false;
        }
        
        int last = nums.back();
        //if last is val
        if (last == val) {
            m[val].pop();
            nums.pop_back();
            return true;
        }
        
        nums[m[val].top()] = last;
        m[last].pop();
        m[last].push(m[val].top());
        
        m[val].pop();
        nums.pop_back();
        
        return true;
    }
    
    /** Get a random element from the collection. */
    int getRandom() {
        if (nums.size() == 0) return -1;
        
        return nums[rand() % nums.size()];
    }
private:
    unordered_map<int, priority_queue<int,vector<int>>> m;
    vector<int> nums;
};

/**
 * Your RandomizedCollection object will be instantiated and called as such:
 * RandomizedCollection* obj = new RandomizedCollection();
 * bool param_1 = obj->insert(val);
 * bool param_2 = obj->remove(val);
 * int param_3 = obj->getRandom();
 */
//Runtime: 52 ms, faster than 94.65% of C++ online submissions for Insert Delete GetRandom O(1) - Duplicates allowed.
//Memory Usage: 23.2 MB, less than 100.00% of C++ online submissions for Insert Delete GetRandom O(1) - Duplicates allowed.
```